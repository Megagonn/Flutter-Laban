// import 'dart:convert';
// import 'dart:io';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laban/color.dart';
// import 'package:laban/model/model.db.dart';
import 'package:laban/model/model.product.dart';
import 'package:laban/service/api.dart';
import 'package:laban/ui/cartPurchase.dart';
// import 'package:laban/ui/product.dart';
import 'package:laban/utilities/cart_card.dart';
// import 'package:laban/utilities/goods_card.dart';
import 'package:laban/utilities/shimer.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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
    // var info = await MyDb.db.getDatabaseInfo();
    // info != null ? canCheckOut = true : null;
    // return info;
    var url = Uri.parse(Api.getCart);
    http.Response response = await http.get(url);
    print(response.body);
    return jsonDecode(response.body)['items'];
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
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Text(
                      "Cart",
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: FutureBuilder(
                    future: getCart(),
                    builder: (context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              shimmerBuilder(context),
                              const SizedBox(
                                height: 20,
                              ),
                              shimmerBuilder(context),
                              const SizedBox(
                                height: 20,
                              ),
                              shimmerBuilder(context),
                              const SizedBox(
                                height: 20,
                              ),
                              shimmerBuilder(context),
                              const SizedBox(
                                height: 20,
                              ),
                              shimmerBuilder(context),
                              const SizedBox(
                                height: 20,
                              ),
                              shimmerBuilder(context),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        );
                      } else {
                        if (snapshot.hasData) {
                          var data = snapshot.data;
                          cartList = data;
                          print(data);
                          // setState(() {});
                          return SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                                reverse: true,
                                // gridDelegate:
                                //     const SliverGridDelegateWithFixedCrossAxisCount(
                                //         mainAxisSpacing: 8,
                                //         crossAxisCount: 2,
                                //         mainAxisExtent: 200),
                                itemCount: data!.length,
                                itemBuilder: (context, value) {
                                  var map = {
                                    "object": Product.fromMapCart(data[value]),
                                    'count': 1
                                  };
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
              ),

              Container(
                margin: const EdgeInsets.only(
                  top: 5,
                ),
                height: 40,
                width: MediaQuery.of(context).size.width,
                // padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: cartList.isNotEmpty ? orange : lgrey,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    // BoxShadow(blurRadius: .5, spreadRadius: .9)
                  ],
                ),
                child: TextButton(
                  onPressed: () {
                    cartList.isNotEmpty
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CartPurchase(),
                              settings: RouteSettings(arguments: cartList),
                            ),
                          )
                        : null;
                  },
                  child: Text(
                    "Check Out",
                    style:
                        TextStyle(color: cartList.isNotEmpty ? white : dgrey),
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
    );
  }
}
