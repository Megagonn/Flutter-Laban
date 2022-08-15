import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:laban/payment/payment.dart';

import '../color.dart';
import '../utilities/backbutton.dart';

class CartPurchase extends StatefulWidget {
  const CartPurchase({Key? key}) : super(key: key);

  @override
  _CartPurchaseState createState() => _CartPurchaseState();
}

class _CartPurchaseState extends State<CartPurchase> {
  bool shipping = true;
  @override
  Widget build(BuildContext context) {
    dynamic cartList = ModalRoute.of(context)!.settings.arguments;
    num subTotal = 0;
    num total = 0;
    num count = 0;
    num shippingFee = shipping ? 1050 : 550;
    for (var i = 0; i < cartList.length; i++) {
      count = count + (cartList[i]['count']);
      subTotal =
          subTotal + (int.parse(cartList[i]['price']) * (cartList[i]['count']));
      total = subTotal * count + (shipping ? 1050 : 550);
    }
    var strTotal = subTotal.toString();
    return Scaffold(
      backgroundColor: lgrey,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      BackBtn(),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Checkout",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox.shrink(),
                ],
              ),
            ),
            Container(
              // height: 200,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // CircleAvatar(
                    //   radius: 70,
                    //   backgroundColor: trans,
                    //   child: AspectRatio(
                    //       aspectRatio: 2 / 3,
                    //       child: Image.network(data['map'].pics)),
                    // ),
                    // Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       Text(data['map'].name,
                    //           style: const TextStyle(
                    //               fontSize: 20, fontWeight: FontWeight.w500)),
                    //       const SizedBox(
                    //         height: 5,
                    //       ),
                    //       Text(
                    //         "# ${data['map'].price}",
                    //         style: TextStyle(
                    //             color: orange,
                    //             fontSize: 15,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     ])
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Shipping method'),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: dgrey,
                        boxShadow: [
                          BoxShadow(
                            blurStyle: BlurStyle.outer,
                            blurRadius: 1,
                            spreadRadius: 1,
                            color: dgrey,
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                shipping = true;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 35,
                              ),
                              decoration: BoxDecoration(
                                color: shipping ? white : dgrey,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                'Home delivery',
                                style: TextStyle(
                                    color: shipping ? dgrey : white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                shipping = false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 35,
                              ),
                              decoration: BoxDecoration(
                                color: shipping ? dgrey : white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                'Pick up in store',
                                style: TextStyle(
                                    color: shipping ? white : dgrey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Flexible(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: const Text('Select your payment method')),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          height: 150,
                          child: Row(children: [
                            Image.asset('assets/bcc.png'),
                            Image.asset('assets/blcc.png'),
                            Image.asset('assets/rcc.png'),
                          ]),
                        ),
                      ),
                      TextButton(
                        child: const Text("+ Add new"),
                        onPressed: () {},
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Container(
                  height: 40,
                  // width: ,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurStyle: BlurStyle.outer,
                        blurRadius: .4,
                        spreadRadius: .7,
                        color: dgrey,
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.apple_sharp),
                      Text('Pay'),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 40,
                  // width: ,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurStyle: BlurStyle.outer,
                        blurRadius: .4,
                        spreadRadius: .7,
                        color: dgrey,
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: const [
                      Text('Google Pay'),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                    height: 40,
                    // width: ,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurStyle: BlurStyle.outer,
                          blurRadius: .4,
                          spreadRadius: .7,
                          color: dgrey,
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.paypal_sharp),
                        Text('Pay'),
                      ],
                    )),
              ]),
            ),
            Flexible(
              child: Container(
                height: 250,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Subtotal ($count items)"),
                          Text("# $subTotal")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Shipping cost"),
                          Text("#$shippingFee")
                        ],
                      ),
                      Divider(color: dgrey, height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                          Text("# $strTotal",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500))
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: orange,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            // BoxShadow(blurRadius: .5, spreadRadius: .9)
                          ],
                        ),
                        child: TextButton(
                          onPressed: () async {
                            var response = await PayNow(
                                    name: 'Goods',
                                    quantity: count.toString(),
                                    price: int.parse(strTotal),
                                    ctx: context,
                                    email: "laban@gmail.com")
                                .chargeNow();
                            response.status
                                ? Navigator.pushNamedAndRemoveUntil(
                                    context, '/', (route) => true)
                                : null;
                            if (kDebugMode) {
                              print({response.status, response.message});
                            }
                          },
                          child: Text(
                            "Check Out",
                            style: TextStyle(color: white),
                          ),
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
