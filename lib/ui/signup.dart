import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:laban/color.dart';
import 'package:http/http.dart' as http;
// import 'modal_progress_hud/modal_progress_hud.dart';
import 'modal_progress_hud.dart';
import 'home.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _key = GlobalKey<FormState>();
  bool signup() {
    return _key.currentState!.validate();
  }

  bool isAsync = false;
  final TextEditingController firstNameEditingController =
      TextEditingController();
  final TextEditingController lastNameEditingController =
      TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _confirmPasswordEditingController =
      TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool obscural = true;
  bool obscural2 = true;
  bool tnc = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: isAsync,
          progressIndicator: const CircularProgressIndicator.adaptive(
            backgroundColor: Colors.yellow,
          ),
          color: primary,
          offset: const Offset(170, 290),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  // height: 470,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: primary, blurRadius: 1, spreadRadius: 2),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sign Up",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: primary,
                          )),
                      Divider(
                        color: grey,
                        thickness: 2,
                      ),
                      Form(
                        key: _key,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextFormField(
                                validator: (val) {
                                  return val.toString().isEmpty
                                      ? "Please fill in your first name"
                                      : null;
                                },
                                cursorColor: primary,
                                controller: firstNameEditingController,
                                decoration: InputDecoration(
                                  labelText: 'First Name',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextFormField(
                                validator: (val) {
                                  return val.toString().isEmpty
                                      ? "Please fill in your last name"
                                      : null;
                                },
                                cursorColor: primary,
                                controller: lastNameEditingController,
                                decoration: InputDecoration(
                                  labelText: 'Last Name',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextFormField(
                                validator: (val) {
                                  return val.toString().isEmpty
                                      ? "Please fill in your password"
                                      : val.toString().length < 7
                                          ? "Password must be atleast 7 characters long"
                                          : null;
                                },
                                obscureText: obscural,
                                cursorColor: primary,
                                controller: _passwordEditingController,
                                decoration: InputDecoration(
                                  suffixIcon: obscural
                                      ? IconButton(
                                          onPressed: () {
                                            obscural = false;
                                            setState(() {});
                                          },
                                          icon: const Icon(
                                              Icons.remove_red_eye_outlined))
                                      : IconButton(
                                          onPressed: () {
                                            obscural = true;
                                            setState(() {});
                                          },
                                          icon: const Icon(Icons.close)),
                                  labelText: 'Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextFormField(
                                validator: (val) {
                                  return val.toString().isEmpty
                                      ? "password not match"
                                      : val.toString() !=
                                              _passwordEditingController.text
                                          ? "Password not match"
                                          : null;
                                },
                                obscureText: obscural2,
                                cursorColor: primary,
                                controller: _confirmPasswordEditingController,
                                decoration: InputDecoration(
                                  suffixIcon: obscural
                                      ? IconButton(
                                          onPressed: () {
                                            obscural2 = false;
                                            setState(() {});
                                          },
                                          icon: const Icon(
                                              Icons.remove_red_eye_outlined))
                                      : IconButton(
                                          onPressed: () {
                                            obscural2 = true;
                                            setState(() {});
                                          },
                                          icon: const Icon(Icons.close)),
                                  labelText: 'Confirm Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextFormField(
                                validator: (val) {
                                  return val.toString().isEmpty
                                      ? "Please fill in your phone number"
                                      : null;
                                },
                                cursorColor: primary,
                                controller: phoneController,
                                decoration: InputDecoration(
                                  labelText: 'Phone',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextFormField(
                                validator: (val) {
                                  var regexp = RegExp(
                                      r"^[a-z0-9A-Z.]{2,}@[a-z]{3,}\.[a-z]{2,}$");
                                  return regexp.hasMatch(val!)
                                      ? null
                                      : "Please fill in a valid email address";
                                },
                                cursorColor: primary,
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CheckboxListTile(
                                value: tnc,
                                onChanged: (value) {
                                  setState(() {
                                    tnc = value!;
                                  });
                                },
                                checkColor: primary,
                                activeColor: grey,
                                secondary: const Text(
                                    "I agree to all the Terms and Policy"),
                                controlAffinity:
                                    ListTileControlAffinity.leading),
                            Center(
                              child: Container(
                                width: 200,
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: primary,
                                ),
                                child: TextButton(
                                  onPressed: () async {
                                    setState(() {
                                      isAsync = true;
                                    });
                                    var url = Uri.parse(
                                        'https://laban.herokuapp.com/user/signup/');
                                    signup();
                                    if (signup()) {
                                      Object data = {
                                        "firstName":
                                            firstNameEditingController.text,
                                        "lastName":
                                            lastNameEditingController.text,
                                        "password":
                                            _passwordEditingController.text,
                                        "phone": phoneController.text,
                                        "email": emailController.text,
                                      };
                                      // "tnc": tnc,
                                      var response =
                                          await http.post(url, body: (data));
                                      var result = response.body;
                                      print(result);

                                      if (result.isNotEmpty) {
                                        isAsync = false;
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const Home(),
                                            settings: RouteSettings(
                                                arguments: response),
                                          ),
                                        );
                                      }
                                      // SharedPreferences pref =
                                      //     await SharedPreferences.getInstance();
                                      // await pref.setString(
                                      //     "signup", jsonEncode(data));
                                      // if(result.isNotEmpty){
                                      // Navigator.pushReplacement(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => const Home(),
                                      //     settings:
                                      //         RouteSettings(arguments: response),
                                      //   ),
                                      //   );

                                      // }
                                      setState(() {
                                        isAsync = false;
                                      });
                                    } else {
                                      setState(() {
                                        isAsync = false;
                                      });
                                    }
                                  },
                                  child: Text(
                                    "Create Account",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: primary,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login()));
                                  },
                                  child: const Text("Log in"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
