import 'package:bottom_animation/source/bottomnav_item.dart';
import 'package:bottom_animation/source/navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laban/ui/cart.dart';
import 'package:laban/ui/home.dart';

import '../color.dart';

// class BottomNavItem {
//   final String title;
//   final Widget widget;
//   final IconData? iconData;

//   BottomNavItem({
//     required this.title,
//     required this.widget,
//     this.iconData,
//   });
// }

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  var items = <BottomNavItem>[
    BottomNavItem(
      title: 'Home',
      // iconData: CupertinoIcons.home,
      widget: const Icon(CupertinoIcons.home),
    ),
    BottomNavItem(
        title: 'Profile',
        // iconData: CupertinoIcons.person,
        widget: const Icon(CupertinoIcons.person)),
    BottomNavItem(
        title: 'Cart',
        // iconData: CupertinoIcons.shopping_cart,
        widget: const Icon(CupertinoIcons.shopping_cart)),
  ];

  var cIndex;
  // var currentPageIndex;
  PageController pageController = PageController();
  @override
  void initState() {
    cIndex = 0;
    // currentPageIndex = 0;
    super.initState();
  }

  List<Widget> list = [
    const Home(),
    const Text('Profile'),
    const Cart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAnimation(
        selectedIndex: cIndex,
        items: items,
        activeIconColor: orange,
        deActiveIconColor: lgrey,
        backgroundColor: orange,
        onItemSelect: (val) {
          setState(() {
            cIndex = val;
          });
        },
        itemHoverColor: dgrey,
        barRadius: 40,
        textStyle: const TextStyle(
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
        ),
        itemHoverWidth: 130,
        itemHoverBorderRadius: 40,
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: list.length,
        onPageChanged: (ind) {
          setState(() {
            cIndex = ind;
          });
        },
        itemBuilder: ((context, index) {
          return list[cIndex];
        }),
      ),
    );
  }
}
