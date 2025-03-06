import 'package:api_calls/view/delete_api.dart';
import 'package:api_calls/view/getapi.dart';
import 'package:api_calls/view/patch_api.dart';
import 'package:api_calls/view/post_api.dart';
import 'package:api_calls/view/put_api.dart';
import 'package:api_calls/view/second_get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
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
      home:
      // Getapi()
      // SecondGet()
      // PostApi(),
      // PutApi(),
      // PatchApi(),
      DeleteApi()
    );
  }
}
