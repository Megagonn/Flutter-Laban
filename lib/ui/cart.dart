import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laban/color.dart';
import 'package:laban/model/model.db.dart';
import 'package:laban/ui/product.dart';
import 'package:laban/utilities/gen.utl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List list = [];
  bool carted = true;
  // getCart() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   var cart = jsonDecode(pref.getString('carts')!) ?? '';
  //   // print(cart);
  //   if (cart.isEmpty) {
  //     setState(() {
  //       carted = false;
  //     });
  //     return carted;
  //   } else {
  //     setState(() {
  //       list.addAll(cart);
  //     });
  //     print(list);
  //     return cart;
  //   }
  // }
  getCart() async{
    var info = await MyDb.db.getDatabaseInfo();
    print(info);
    return info;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCart();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              carted ? ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: ((context, index) {
                  return SizedBox.shrink()
                  // Products(map: list[index], bg: trans)
                     ;
                }),
              )  : const Center(child: Text('Your cart is empty')),
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
              //           Container(
              //                 width: MediaQuery.of(context).size.width,
              //                 padding: const EdgeInsets.all(3),
              //                 decoration: BoxDecoration(
              //                   color: orange,
              //                   borderRadius: BorderRadius.circular(30),
              //                   boxShadow: const [
              //                     // BoxShadow(blurRadius: .5, spreadRadius: .9)
              //                   ],
              //                 ),
              //                 child: TextButton(
              //                   onPressed: () {},
              //                   child: Text(
              //                     "Finalise Purchase",
              //                     style: TextStyle(color: white),
              //                   ),
              //                 ),
              //               ),
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
