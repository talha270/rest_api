import 'package:flutter/material.dart';
import 'package:rest_api_tutorial/post/auth_pages/signup_page.dart';
import 'package:get/get.dart';
import 'package:rest_api_tutorial/post/images.dart';
import 'package:rest_api_tutorial/put_and_patch/putandpatch.dart';

import 'delete/delete_api.dart';
void main() {

  int a=5;
  print("5"*a);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DeleteApi(),
    );
  }
}
