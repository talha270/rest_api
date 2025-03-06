import 'package:api_calls/controller/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PutApi extends StatelessWidget {
  PutApi({super.key});
  final controller=Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("put API"),
      ),
      body:
      Center(
        child: ElevatedButton(onPressed: () async{
          final response=await controller.putrequest(url: 'https://jsonplaceholder.typicode.com/posts/1', body: {
    "id": 1,
    "title": 'food dsjfl dfjsdf dlfj dsf',
    "body": 'bar',
    "userId": 1,
  },headers: {
            'Content-type': 'application/json; charset=UTF-8',
          },);
          if(response!=null)
            Get.snackbar(response["title"]??"sdfd", response["body"]??"sdggsdf");
        }, child: Text("put api")),
      ),
    );
  }
}
