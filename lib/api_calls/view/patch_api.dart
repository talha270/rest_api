import 'package:api_calls/controller/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatchApi extends StatelessWidget {
  PatchApi({super.key});
  final controller=Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("patch API"),
      ),
      body:
      Center(
        child: ElevatedButton(onPressed: () async{
          final response=await controller.patchrequest(url: 'https://jsonplaceholder.typicode.com/posts/1', body: {
            "title": 'food',
          },headers: {
            'Content-type': 'application/json; charset=UTF-8',
          },);
          if(response!=null)
            Get.snackbar(response["title"]??"sdfd", response["body"]??"sdggsdf");
        }, child: Text("patch api")),
      ),
    );
  }
}
