import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var response = ModalRoute.of(context)!.settings.arguments;
    print(response.toString());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Laban'),
      ),
      // body: Column(children: [Text(response!.body)]),
    ));
  }
}
