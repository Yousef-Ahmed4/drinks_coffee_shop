import 'package:flutter/material.dart';
import 'package:shopapp/models/crud.dart';

import '../../../constants.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> with Crud {
  getCategory() async {
    var responce = await postRequest(
        "http://10.0.2.2:80/shop_app_back_end/categoties/category.php");
    return responce;
  }

  // List<String> categories = ['hand bag', 'jewellery', 'shoses', 'dresses'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getCategory(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()
                //  Text('is loading...'),
                );
          }
          if (snapshot.hasData) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
              height: 25,
              child: ListView.builder(
                  itemCount: snapshot.data["data"].length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                          child: Column(
                            children: [
                              Text(
                                // categories[index]
                                snapshot.data["data"][index]["category_name"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: selectedIndex == index
                                        ? kTextColor
                                        : kTextLightColor,
                                    fontSize: 15),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(top: kDefaultPadding / 4),
                                color: selectedIndex == index
                                    ? Colors.black
                                    : Colors.white,
                                height: 2,
                                width: 30,
                              )
                            ],
                          ),
                        ),
                      )),
            );
          }
          return Center(child: Text('is loading...'));
        });
  }
}
