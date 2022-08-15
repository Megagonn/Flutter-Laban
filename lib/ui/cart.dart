import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laban/color.dart';
import 'package:laban/model/model.db.dart';
import 'package:laban/model/model.product.dart';
import 'package:laban/ui/cartPurchase.dart';
import 'package:laban/ui/product.dart';
import 'package:laban/utilities/cartlist.dart';
import 'package:laban/utilities/gen.utl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List cartList = [];
  bool carted = true;
  bool canCheckOut = false;
  getCart() async {
    var info = await MyDb.db.getDatabaseInfo();
    info != null ? canCheckOut = true : null;
    return info;
  }

  @override
  void initState() {
    super.initState();
    getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lgrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Cart",
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                    future: getCart(),
                    builder: (context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator.adaptive(
                          backgroundColor: primary,
                        );
                      } else {
                        if (snapshot.hasData) {
                          var data = snapshot.data;
                          cartList = data;
                          return SizedBox(
                            height: MediaQuery.of(context).size.height - 224,
                            child: ListView.builder(
                                // gridDelegate:
                                //     const SliverGridDelegateWithFixedCrossAxisCount(
                                //         mainAxisSpacing: 8,
                                //         crossAxisCount: 2,
                                //         mainAxisExtent: 200),
                                itemCount: data!.length,
                                itemBuilder: (context, value) {
                                  var map = {"object":Product.fromMapCart(data[value]), 'count': 1};
                                  return InkWell(
                                    child: CartItem(
                                      object: map,
                                      // bg: value % 2 == 0 ? c1 : c2,
                                    ),
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: ((context) => const Goods()),
                                      //     settings: RouteSettings(arguments: map),
                                      //   ),
                                      // );
                                    },
                                  );
                                }),
                          );
                        } else {
                          return const Center(
                            child: Text('Your cart is empty'),
                          );
                        }
                      }
                    }),
                    const Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: canCheckOut ? orange : lgrey,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      // BoxShadow(blurRadius: .5, spreadRadius: .9)
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {
                      canCheckOut
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CartPurchase(),
                                  settings: RouteSettings(arguments: cartList),),)
                          : null;
                    },
                    child: Text(
                      "Check Out",
                      style: TextStyle(color: canCheckOut ? white : dgrey),
                    ),
                  ),
                ),
                // carted
                //     ? ListView.builder(
                //         shrinkWrap: true,
                //         itemCount: list.length,
                //         itemBuilder: ((context, index) {
                //           List cart = getCart();
                //           print(list);
                //           return SizedBox.shrink()
                //               // Products(map: list[index], bg: trans)
                //               ;
                //         }),
                //       )
                //     : const Center(child: Text('Your cart is empty')),
                //   Flexible(
                //   child: Container(
                //     height: 250,
                //     padding: const EdgeInsets.all(10),
                //     decoration: BoxDecoration(
                //       color: white,
                //       borderRadius: const BorderRadius.only(
                //         topLeft: Radius.circular(30),
                //         topRight: Radius.circular(30),
                //       ),
                //     ),
                //     child: Column(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               // Text("Subtotal (${data['count']} items)"),
                //               // Text("# $strTotal")
                //             ],
                //           ),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: const [
                //               Text("Shipping cost"),
                //               Text("Free shipping")
                //             ],
                //           ),
                //           Divider(color: dgrey, height: 4),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               const Text("Total",
                //                   style: TextStyle(
                //                       fontSize: 15, fontWeight: FontWeight.w500)),
                //               // Text("# $strTotal",
                //                   // style: const TextStyle(
                //                       // fontSize: 15, fontWeight: FontWeight.w500))
                //             ],
                //           ),
                // Container(
                //       width: MediaQuery.of(context).size.width,
                //       padding: const EdgeInsets.all(3),
                //       decoration: BoxDecoration(
                //         color: orange,
                //         borderRadius: BorderRadius.circular(30),
                //         boxShadow: const [
                //           // BoxShadow(blurRadius: .5, spreadRadius: .9)
                //         ],
                //       ),
                //       child: TextButton(
                //         onPressed: () {},
                //         child: Text(
                //           "Finalise Purchase",
                //           style: TextStyle(color: white),
                //         ),
                //       ),
                //     ),
                //         ]),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
