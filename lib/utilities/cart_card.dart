import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:laban/color.dart';
import 'package:laban/providers/count_provider.dart';
import 'package:laban/service/api.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CartItem extends StatefulWidget {
  final dynamic object;
  const CartItem({Key? key, required this.object}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

int count = 1;

class _CartItemState extends State<CartItem> {
  CurrencyTextInputFormatter formatter =
      CurrencyTextInputFormatter(symbol: 'NGN', decimalDigits: 00);
  increment() async {
    var url = Uri.parse(Api.increaseCartItem);
    var response = await http.patch(url, body: {
      'email': 'a@gmail.com',
      'productId': widget.object['productId'],
    });
    print(response.body);
    if (response.body == 'success') {
      setState(() {
        // count++;
        // if (kDebugMode) {
        //   print(count);
        //   CountNotifier().countIncrement(count);
        // }
      });
    }
  }

  decrement() async {
    var url = Uri.parse(Api.decreaseCartItem);
    var response = await http.post(url, body: {
      'email': 'abc@gmail.com',
      'productId': 1,
    });
    if (response.body == 'success') {
      setState(() {
        count++;
        // if (kDebugMode) {
        //   print(count);
        //   CountNotifier().countIncrement(count);
        // }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var object = widget.object;
    // count = int.parse(object['count']);
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: white,
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Container(
                height: 120,
                margin: const EdgeInsets.all(5),
                child: AspectRatio(
                    aspectRatio: 2 / 3, child: Image.network(object['pics'])),
              ),
            ),
            Flexible(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(object['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          )),
                      Text(formatter.format(object['price'].toString()),
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          )),
                      // const Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Remove Item",
                            style: TextStyle(color: Colors.redAccent),
                          ))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        // radius: 14,
                        backgroundColor: orange,
                        child: IconButton(
                          onPressed: () {
                            if (kDebugMode) {
                              print("Increasing cart...");
                            }
                            increment();
                          },
                          icon: const Icon(Icons.add_sharp),
                        ),
                      ),
                      CircleAvatar(
                        foregroundColor: dgrey,
                        backgroundColor: trans,
                        child: Text(object['count'].toString()),
                        //     Consumer<CountNotifier>(
                        //   builder: (_, value, __) =>
                        //       Text(value.tempCount.toString()),
                        // )
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  color: lgrey,
                                  offset: Offset.zero,
                                  blurRadius: .3,
                                  spreadRadius: .3)
                            ]),
                        child: CircleAvatar(
                          // radius: 20,
                          backgroundColor: white,
                          child: IconButton(
                            onPressed: () {
                              if (kDebugMode) {
                                print("Decreasing cart...");
                              }
                              decrement();
                            },
                            icon: const Icon(Icons.remove_sharp),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
