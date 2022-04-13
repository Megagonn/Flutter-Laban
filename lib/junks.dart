// import 'package:flutter/material.dart';

// class SignUpb extends StatelessWidget {
//   const SignUpb({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Expanded(
//             child: Column(
//           // ignore: prefer_const_literals_to_create_immutables
//           children: [
//             // ignore: prefer_const_constructors
//             Text(
//               "Create account",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 22,
//               ),
//             ),
//             // ignore: prefer_const_constructors
//             Text(
//               "For gadgets, clothes and more",
//               style: TextStyle(
//                 fontWeight: FontWeight.w300,
//                 fontSize: 10,
//               ),
//             ),
//             Form(
//               autovalidateMode: AutovalidateMode.always,
//               child: Column(
//                 children: [
//                   Container(
//                     // ignore: prefer_const_constructors
//                     decoration: BoxDecoration(
//                       boxShadow: const [
//                         // ignore: prefer_const_constructors
//                         BoxShadow(
//                           color: Color(0xFFe5e5e5),
//                           offset: Offset.zero,
//                           blurRadius: 0.5,
//                           spreadRadius: 0.9,
//                           blurStyle: BlurStyle.normal,
//                         ),
//                       ],
//                     ),
//                     child: TextFormField(
//                       // ignore: prefer_const_constructors
//                       decoration: InputDecoration(
//                           labelText: "First Name",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: (BorderSide.none),
//                           )),
//                     ),
//                   ),
//                   Container(
//                     // ignore: prefer_const_constructors
//                     decoration: BoxDecoration(
//                       boxShadow: const [
//                         // ignore: prefer_const_constructors
//                         BoxShadow(
//                           color: Color(0xFFe5e5e5),
//                           offset: Offset.zero,
//                           blurRadius: 0.5,
//                           spreadRadius: 0.9,
//                           blurStyle: BlurStyle.normal,
//                         ),
//                       ],
//                     ),
//                     child: TextFormField(
//                       // ignore: prefer_const_constructors
//                       decoration: InputDecoration(
//                           labelText: "Last Name",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: (BorderSide.none),
//                           )),
//                     ),
//                   ),
//                   Container(
//                     // ignore: prefer_const_constructors
//                     decoration: BoxDecoration(
//                       boxShadow: const [
//                         // ignore: prefer_const_constructors
//                         BoxShadow(
//                           color: Color(0xFFe5e5e5),
//                           offset: Offset.zero,
//                           blurRadius: 0.5,
//                           spreadRadius: 0.2,
//                           blurStyle: BlurStyle.normal,
//                         ),
//                         BoxShadow(
//                           color: Color(0xFFe5e5e5),
//                           offset: Offset.zero,
//                           blurRadius: 2.5,
//                           spreadRadius: 0.9,
//                           blurStyle: BlurStyle.normal,
//                         ),
//                         BoxShadow(
//                           color: Color(0xFFe5e5e5),
//                           offset: Offset.zero,
//                           blurRadius: 0.5,
//                           spreadRadius: 0.3,
//                           blurStyle: BlurStyle.normal,
//                         ),
//                       ],
//                     ),
//                     child: TextFormField(
//                       // ignore: prefer_const_constructors
//                       decoration: InputDecoration(
//                         labelText: "Email",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: (BorderSide.none),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     // ignore: prefer_const_constructors
//                     decoration: BoxDecoration(
//                       boxShadow: const [
//                         // ignore: prefer_const_constructors
//                         BoxShadow(
//                           color: Color(0xFFe5e5e5),
//                           offset: Offset.zero,
//                           blurRadius: 0.5,
//                           spreadRadius: 0.9,
//                           blurStyle: BlurStyle.normal,
//                         ),
//                       ],
//                     ),
//                     child: TextFormField(
//                       // ignore: prefer_const_constructors
//                       decoration: InputDecoration(
//                         labelText: "Phone",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: (BorderSide.none),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     // ignore: prefer_const_constructors
//                     decoration: BoxDecoration(
//                       boxShadow: const [
//                         // ignore: prefer_const_constructors
//                         BoxShadow(
//                           color: Color(0xFFe5e5e5),
//                           offset: Offset.zero,
//                           blurRadius: 0.5,
//                           spreadRadius: 0.9,
//                           blurStyle: BlurStyle.normal,
//                         ),
//                       ],
//                     ),
//                     child: TextFormField(
//                       // ignore: prefer_const_constructors
//                       decoration: InputDecoration(
//                         labelText: "Password",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: (BorderSide.none),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     // ignore: prefer_const_constructors
//                     decoration: BoxDecoration(
//                       boxShadow: const [
//                         // ignore: prefer_const_constructors
//                         BoxShadow(
//                           color: Color(0xFFe5e5e5),
//                           offset: Offset.zero,
//                           blurRadius: 0.5,
//                           spreadRadius: 0.9,
//                           blurStyle: BlurStyle.normal,
//                         ),
//                       ],
//                     ),
//                     child: TextFormField(
//                       // ignore: prefer_const_constructors
//                       decoration: InputDecoration(
//                         labelText: "Confirm Password",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: (BorderSide.none),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             CheckboxListTile(
//               value: true,
//               onChanged: (value) {},
//               title: const Text("I agree to all the Terms and Policy"),
//             ),
//             ElevatedButton(
//                 onPressed: () {}, child: const Text("Create account"))
//           ],
//         )),
//       ),
//     );
//   }
// }