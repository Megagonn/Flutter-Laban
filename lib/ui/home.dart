import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:laban/color.dart';
import 'package:laban/model/model.product.dart';
import 'package:laban/utilities/cat.utilities.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future getProducts() async {
    var uri = "https://laban.herokuapp.com/admin/products/";
    var url = Uri.parse(uri);
    try {
      var response = await http.get(url);
      var result = response.body;
      // print(response.body);
      return result;
    } catch (e) {
      return e;
    }
  }

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var response = ModalRoute.of(context)!.settings.arguments;
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(
      //   title: const Text('Laban'),
      // ),
      body: Container(
        color: Colors.grey.shade200,
        // ignore: prefer_const_constructors
        padding: EdgeInsets.all(10),
        height: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  width: 280,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      suffix: const Icon(
                        Icons.search_outlined, color: Colors.grey,
                      ),
                      suffixIconConstraints: const BoxConstraints(
                        maxWidth: 20,
                        maxHeight:20,
                      ),
                      hintText: "Search products",
                      
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    cursorColor: grey,
                  ),
                ),
                Stack(
                  // ignore: prefer_const_literals_to_create_immutables
                  children:[
                    // ignore: prefer_const_constructors
                    CircleAvatar(
                      backgroundColor: white,
                      child: Icon(Icons.notifications_outlined, color: grey,),
                    ),
                    Positioned(
                      child: Container(
                        width: 10,
                        height:10,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    )
                  ]
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 70,
              // padding: const EdgeInsets.symmetric(vertical: 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children:[
                    const Category(text: "Technology"),
                    const SizedBox(
                      width: 10
                    ),
                    const Category(text: "Sport"),
                    const SizedBox(
                      width: 10
                    ),
                    const Category(text: "Gadget"),
                    const SizedBox(
                      width: 10
                    ),
                    const Category(text: "Home Appliances"),
                    const SizedBox(
                      width: 10
                    ),
                    const Category(text: "Wears"),
                    const SizedBox(
                      width: 10
                    ),
                    const Category(text: "Fashion"),
                    
                    
                    
                  ]
                ),
              ),
            ),
            SingleChildScrollView(
              child: FutureBuilder(
                  future: getProducts(),
                  builder: (context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator.adaptive(
                        backgroundColor: primary,
                      );
                    } else {
                      var data = snapshot.data;
                      var json = (jsonDecode(data));
            
                      return SizedBox(
                        height: 300,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: json!.length,
                            itemBuilder: (context, value) {
                              var map = Product.toMap(json[value]);
                              return CircleAvatar(child: Image.network(map.pics));
                            }),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
