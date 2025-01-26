import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Signup"),
        ),
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      boxShadow: const [BoxShadow(blurRadius: 5)],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(16),
                  // margin: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width/30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: emailcontroller,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    hintText: "example@Emart.com",
                                    isDense: true,
                                    // border: InputBorder.none,
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: passwordcontroller,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    hintText: "*********",
                                    isDense: true,
                                    // border: InputBorder.none,
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                            width: MediaQuery.sizeOf(context).width - 50,
                            child: ElevatedButton(
                              child: Text("Signup"),
                              onPressed: () {
                                signup(
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text);
                              //   login(
                              //       email: emailcontroller.text,
                              //       password: passwordcontroller.text);
          
                              },
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  signup({email, password}) async {
    try {
      final response = await http.post(
          Uri.parse("https://reqres.in/api/register"),
          body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print("login successfully");
      } else {
        print("login failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  login({email, password}) async {
    try {
      final response = await http.post(
          Uri.parse("https://reqres.in/api/login"),
          body: {"email": email, "password": password});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print("login successfully");
      } else {
        print("login failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
