import 'package:api_calls/controller/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteApi extends StatelessWidget {
  DeleteApi({super.key});
  final controller=Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("delete API"),
      ),
      body:
      Center(
        child: ElevatedButton(onPressed: () async{
          final response=await controller.deleterequest(url: 'https://jsonplaceholder.typicode.com/posts/1',
          //   headers: {
          //   'Content-type': 'application/json; charset=UTF-8',
          // }
          );
          if(response!=null)
            Get.snackbar(response["title"]??"sdfd", response["body"]??"sdggsdf");
        }, child: Text("delete api")),
      ),
    );
  }
}
