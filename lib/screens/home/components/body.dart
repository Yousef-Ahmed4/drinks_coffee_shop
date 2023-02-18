import 'package:flutter/material.dart';
import 'package:shopapp/constants.dart';
import 'package:shopapp/models/crud.dart';
import 'package:shopapp/models/product.dart';
import 'package:shopapp/screens/details/details_screen.dart';
import 'package:shopapp/screens/home/components/item_card.dart';
import 'categories.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with Crud {
  getProducts() async {
    var responce = await postRequest(
        "http://192.168.1.8:80/shop_app_back_end/product/show.php");
    return responce;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            'Women',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: MediaQuery.of(context).size.height * 3 / 4,
          // width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
              future: getProducts(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator()
                      //  Text('is loading...'),
                      );
                }
                if (snapshot.hasData) {
                  if (snapshot.data["status"] == 'fail')
                    return Center(
                        child: Text(
                      'no data',
                      style: TextStyle(fontSize: 23),
                    ));

                  return GridView.builder(
                    itemCount: snapshot.data["data"].length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: kDefaultPadding,
                      crossAxisSpacing: kDefaultPadding,
                      crossAxisCount: 2,
                      childAspectRatio: 0.80,
                    ),
                    itemBuilder: (context, index) => InkWell(
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  product: Product(
                                    id: snapshot.data["data"][index]["id"],
                                    title: snapshot.data["data"][index]["name"],
                                    price: snapshot.data["data"][index]
                                        ["price"],
                                    color: Color(int.parse(
                                        snapshot.data["data"][index]["color"])),
                                    description: snapshot.data["data"][index]
                                        ["description"],
                                    category_id: snapshot.data["data"][index]
                                        ["category_id"],
                                    image: snapshot.data["data"][index]["img"],
                                    size: snapshot.data["data"][index]["size"],
                                  )

                                  //  products[index]
                                  ,
                                ),
                              ),
                            ),
                        child: int.parse(snapshot.data["data"][index]
                                    ["category_id"]) ==
                                1
                            ? ItemCard(
                                product: Product(
                                id: snapshot.data["data"][index]["id"],
                                title: snapshot.data["data"][index]["name"],
                                price: snapshot.data["data"][index]["price"],
                                color: Color(int.parse(
                                    snapshot.data["data"][index]["color"])),
                                description: snapshot.data["data"][index]
                                    ["description"],
                                category_id: snapshot.data["data"][index]
                                    ["category_id"],
                                image: snapshot.data["data"][index]["img"],
                                size: snapshot.data["data"][index]["size"],
                              )
                                //  products[index],
                                )
                            : Center(
                                child: Text(snapshot.data["data"][index]
                                    ["category_id"]))),
                  );
                }
                return Center(child: Text('is loading...'));
              }),
        ),
      ],
    );
  }
}
