import 'package:flutter/material.dart';

import '../color.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool filled = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              CircleAvatar(
                backgroundColor: trans,
                child: IconButton(
                  icon: Icon(
                    Icons.chevron_left_sharp,
                    color: lgrey,
                  ),
                  onPressed: () {
                    Navigator.canPop(context);
                  },
                ),
              ),
              CircleAvatar(
                backgroundColor: trans,
                child: IconButton(
                  icon: Icon(
                    !filled ? Icons.favorite_border_outlined : Icons.favorite,
                    color: primary,
                  ),
                  onPressed: () {
                    setState(() {
                      filled = !filled;
                    });
                  },
                ),
              )
            ]),
            Container()///image container
          ],
        ),
      ),
    ));
  }
}
