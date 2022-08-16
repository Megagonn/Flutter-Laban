import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:laban/model/model.product.dart';

import '../color.dart';

class Products extends StatefulWidget {
  const Products({Key? key, required this.map, required this.bg})
      : super(key: key);
  final Product map;
  final Color bg;

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  CurrencyTextInputFormatter formatter = CurrencyTextInputFormatter(symbol: 'NGN',);
  bool filled = false;

  @override
  Widget build(BuildContext context) {
    // var map = widget.map;
    return Container(
      // height: 600,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: widget.bg, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                // margin: const EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(
                    color: trans, borderRadius: BorderRadius.circular(30)),
                child: CircleAvatar(
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
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: AspectRatio(
                  aspectRatio: 1, child: Image.network(widget.map.pics)),
            ),
          ),
          Text(
            widget.map.name,
            // style: const TextStyle(
            //     fontWeight: FontWeight.bold),
          ),
          Container(
              margin: const EdgeInsets.only(top: 4),
              child: Text(
                formatter.format(widget.map.price),
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
