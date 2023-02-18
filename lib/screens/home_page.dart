import 'package:flutter/material.dart';
import 'package:shopapp/screens/appbar.dart';
import 'package:shopapp/screens/home/components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(Colors.white, () {}),
      body: Body(),
    );
  }
}
