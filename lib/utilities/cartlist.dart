import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laban/color.dart';

class CartItem extends StatefulWidget {
  final dynamic object;
  const CartItem({Key? key, required this.object}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int count = 0;
  increment() {
    setState(() {
      count++;
      print(count);
    });
  }

  decrement() {
    if (count > 1) {
      setState(() {
        count--;
        print(count);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    count = widget.object['count'];
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
                    aspectRatio: 2 / 3,
                    child: Image.network(widget.object['object'].pics)),
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
                      const SizedBox(height:20,),
                      Text(
                        widget.object['object'].name,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22,)
                      ),
                      Text(
                        widget.object['object'].price,
                        style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 22,)
                      ),
                      // const Spacer(),
                      TextButton(onPressed: (){}, child: const Text("Remove Item", style: TextStyle(color: Colors.redAccent),))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                            onPressed: decrement,
                            icon: const Icon(Icons.remove_sharp),
                          ),
                        ),
                      ),
                      CircleAvatar(
                          foregroundColor: dgrey,
                          backgroundColor: trans,
                          child: Text(
                            count.toString(),
                          )),
                      CircleAvatar(
                        // radius: 14,
                        backgroundColor: orange,
                        child: IconButton(
                          onPressed: increment,
                          icon: const Icon(Icons.add_sharp),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}