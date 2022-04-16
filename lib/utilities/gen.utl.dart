import 'package:flutter/material.dart';
import 'package:laban/model/model.product.dart';

import '../color.dart';

class Products extends StatefulWidget {
  const Products({Key? key, required this.map}) : super(key: key);
  final Product map;

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  // ignore: unnecessary_this

  @override
  Widget build(BuildContext context) {
    // var map = widget.map;
    return Container(
      // height: 600,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade400, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(30)),
            child: CircleAvatar(
              child: IconButton(
                icon: const Icon(Icons.favorite_border_outlined),
                onPressed: () {},
              ),
            ),
          ),
          Center(
            child: Container(
              // height: 200,
              margin: const EdgeInsets.all(5),
              child: AspectRatio(
                aspectRatio: 2/3,
                child: Image.network(widget.map.pics)),
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
                "#${widget.map.price}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
