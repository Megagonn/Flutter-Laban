import 'package:flutter/material.dart';

import '../color.dart';

class Category extends StatelessWidget {
  const Category({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(color: primary, blurRadius: .5, spreadRadius: 1)
            ]),
        child: Text(text),
      ),
    );
  }
}
