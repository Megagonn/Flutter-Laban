import 'package:flutter/material.dart';
import 'package:laban/model/model.product.dart';

import '../color.dart';

class HotSales extends StatelessWidget {
  const HotSales({Key? key, required this.map}) : super(key: key);
  final Product map;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.grey.shade400, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(30)),
              child: Text(
                "Free shiping",
                style: TextStyle(color: primary),
              ),
            ),
          ),
          Center(
            child: Container(
              height: 100,
              margin: const EdgeInsets.all(10),
              child: Image.network(map.pics),
            ),
          ),
          Flexible(
            child: Text(
              map.name,
              // style: const TextStyle(
              //     fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            child: Container(
                margin: const EdgeInsets.only(top: 4),
                child: Text(
                  "#${map.price}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    );
  }
}
