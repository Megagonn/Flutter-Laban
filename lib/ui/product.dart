import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:laban/ui/purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../color.dart';
import '../utilities/backbutton.dart';

class Goods extends StatefulWidget {
  const Goods({Key? key}) : super(key: key);

  @override
  _GoodsState createState() => _GoodsState();
}

class _GoodsState extends State<Goods> {
  bool filled = false;
  // ignore: prefer_final_fields
  int _counter = 1;
  // int get counter => _counter;
  @override
  Widget build(BuildContext context) {
    dynamic product = ModalRoute.of(context)!.settings.arguments;
    return SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: lgrey,
          body: Container(
            // padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const BackBtn(),
                        CircleAvatar(
                          backgroundColor: trans,
                          child: IconButton(
                            icon: Icon(
                              !filled
                                  ? Icons.favorite_border_outlined
                                  : Icons.favorite,
                              color: primary,
                            ),
                            onPressed: () {
                              setState(() {
                                filled = !filled;
                              });
                            },
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: trans,
                          child: IconButton(
                            icon: Icon(
                              Icons.add_shopping_cart_sharp,
                              color: primary,
                            ),
                            onPressed: () async {
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              // pref.clear();
                              List cart = [];
                              var favourites = (pref.get('carts'));
                              if (favourites == null) {
                                pref.setString(
                                    'carts',
                                    jsonEncode({
                                      "pics": product.pics,
                                      "price": product.price,
                                      "name": product.name,
                                      "count": _counter,
                                    }));
                              } else {
                                cart.addAll([favourites]);
                                cart.add({
                                  "pics": product.pics,
                                  "price": product.price,
                                  "name": product.name,
                                  "count": _counter
                                });
                                pref.setString('carts', jsonEncode(cart));
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  padding: const EdgeInsets.all(15),
                                  backgroundColor: lgrey,
                                  elevation: 10,
                                  duration: const Duration(seconds: 2),
                                  content: Text(
                                    "Added to cart",
                                    style: TextStyle(
                                      color: orange,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ]),
                ),
                Flexible(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      child: AspectRatio(
                        aspectRatio: 5 / 6,
                        child: Image.network(product!.pics),
                      ),
                    ),
                  ),
                ),

                ///image container
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: 30,
                    height: 5,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
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
                             Text(
                                    "Shipping fee: #${product.shippingFee}",
                                    style: TextStyle(
                                      color: orange,
                                      fontSize: 13,
                                    ),
                                  ),
                                // : const SizedBox.shrink(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.star, color: primary),
                                Text('(product.rating)')
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox.shrink(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Quantity: ${product.quantity}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                          child: Text(
                            product.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 30),
                          ),
                        ),
                        Container(
                          child: Text(product.description,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                        Text(
                          '#${product.price}',
                          style: TextStyle(color: orange),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: trans,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: .5,
                                        spreadRadius: .9,
                                        color: orange,
                                        blurStyle: BlurStyle.outer)
                                  ]),
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        if (_counter > 1) {
                                          setState(() {
                                            _counter--;
                                          });
                                        }
                                      },
                                      icon: const Icon(Icons.remove)),
                                  Text(_counter.toString()),
                                  IconButton(
                                    onPressed: () {
                                      if (_counter < product.quantity) {
                                        setState(() {
                                          _counter++;
                                        });
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 180,
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: orange,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  // BoxShadow(blurRadius: .5, spreadRadius: .9)
                                ],
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => Purchase()),
                                          settings: RouteSettings(arguments: {
                                            "map": product,
                                            "count": _counter,
                                            // "shippingFee": ,
                                          })));
                                },
                                child: Text(
                                  "Buy Now",
                                  style: TextStyle(color: white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
