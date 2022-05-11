import 'dart:convert';

import 'package:bottom_animation/bottom_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:laban/color.dart';
import 'package:laban/model/model.product.dart';
import 'package:laban/ui/product.dart';
import 'package:laban/utilities/cat.utl.dart';
import 'package:laban/utilities/gen.utl.dart';
import 'package:laban/utilities/hotsales.utl.dart';


class MyBottomNavItem {
  final String title;
  final Widget widget;
  final IconData? iconData;

  MyBottomNavItem({
    required this.title,
    required this.widget,
    this.iconData,
  });
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future getProducts() async {
    var uri = "https://laban.herokuapp.com/admin/products/";
    var url = Uri.parse(uri);
    try {
      var response = await http.get(url);
      var result = response.body;
      // print(response.body);
      return result;
    } catch (e) {
      return e;
    }
  }

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var response = ModalRoute.of(context)!.settings.arguments;
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(
      //   title: const Text('Laban'),
      // ),
      body: Container(
        color: Colors.grey.shade200,
        // ignore: prefer_const_constructors
        padding: EdgeInsets.all(10),
        height: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  width: 280,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      suffix: const Icon(
                        Icons.search_outlined,
                        color: Colors.grey,
                      ),
                      suffixIconConstraints: const BoxConstraints(
                        maxWidth: 20,
                        maxHeight: 20,
                      ),
                      hintText: "Search products",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    cursorColor: grey,
                  ),
                ),
                Stack(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      CircleAvatar(
                        backgroundColor: white,
                        child: Icon(
                          Icons.notifications_outlined,
                          color: grey,
                        ),
                      ),
                      Positioned(
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      )
                    ])
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              // padding: const EdgeInsets.symmetric(vertical: 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Category(text: "Technology"),
                      const SizedBox(width: 10),
                      const Category(text: "Sport"),
                      const SizedBox(width: 10),
                      const Category(text: "Gadget"),
                      const SizedBox(width: 10),
                      const Category(text: "Home Appliances"),
                      const SizedBox(width: 10),
                      const Category(text: "Wears"),
                      const SizedBox(width: 10),
                      const Category(text: "Fashion"),
                    ]),
              ),
            ),
            // const SizedBox(
            //   width: 5,
            // ),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Hot Sales",
                        style: Theme.of(context).textTheme.headline6,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  FutureBuilder(
                      future: getProducts(),
                      builder: (context, AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SizedBox.shrink();
                        } else {
                          var data = jsonDecode(snapshot.data);
                          var list = <Widget>[];
                          for (var i = 0; i < data.length; i++) {
                            var map = Product.fromMap(data[i]);
                            list.add(map.discount
                                ? InkWell(
                                    child: HotSales(map: map),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: ((context) => const Goods()),
                                          settings:
                                              RouteSettings(arguments: map),
                                        ),
                                      );
                                    },
                                  )
                                : const SizedBox.shrink());
                          }
                          // print(list);
                          return SizedBox(
                            height: 200,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: list,
                              ),
                            ),
                          );
                        }
                      })
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "All Product",
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Flexible(
              child: SingleChildScrollView(
                child: FutureBuilder(
                    future: getProducts(),
                    builder: (context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator.adaptive(
                          backgroundColor: primary,
                        );
                      } else {
                        var data = snapshot.data;
                        var json = (jsonDecode(data));

                        return SizedBox(
                          height: 320,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 8,
                                      crossAxisCount: 2,
                                      mainAxisExtent: 310),
                              itemCount: json!.length,
                              itemBuilder: (context, value) {
                                var map = Product.fromMap(json[value]);
                                return InkWell(
                                  child: Products(
                                    map: map,
                                    bg: value % 2 == 0 ? c1 : c2,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) => const Goods()),
                                        settings: RouteSettings(arguments: map),
                                      ),
                                    );
                                  },
                                );
                              }),
                        );
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
