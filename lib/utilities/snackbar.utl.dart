import 'package:flutter/material.dart';
import 'package:laban/color.dart';

class SnackSheet{

  snack({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(15),
        backgroundColor: lgrey,
        elevation: 10,
        duration: const Duration(seconds: 2),
        content: Text(
          message,
          style: TextStyle(
            color: orange,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
