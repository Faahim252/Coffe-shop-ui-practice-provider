import 'package:coffe_shop/pages/Cartpage.dart';
import 'package:coffe_shop/pages/shoppage.dart';
import 'package:flutter/material.dart';
import '../Components/buttomnav.dart';
import '../constants.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _sellectindex = 0;
  void NavigateBottonbar(int index) {
    setState(() {
      _sellectindex = index;
    });
  }

  //pages list

  final List<Widget> _pages = [
    /// shop page
    Shoppage(),

    /// cart poge'
    Cartpage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      bottomNavigationBar:
          MyButtonNav(Ontap: (index) => NavigateBottonbar(index)),
      body: _pages[_sellectindex],
    );
  }
}
