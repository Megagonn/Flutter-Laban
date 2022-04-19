import 'package:flutter/material.dart';

import '../color.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: trans,
      child: IconButton(
        icon: Icon(
          Icons.chevron_left_sharp,
          color: orange,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
