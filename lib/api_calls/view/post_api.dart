import 'package:api_calls/controller/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostApi extends StatelessWidget {
  PostApi({super.key});
  final controller=Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("post API"),
        ),
        body:
        Center(
          child: ElevatedButton(onPressed: () async{
            final response=await controller.postrequest(url: 'https://jsonplaceholder.typicode.com/posts', body: {
              "title": 'food djalfd fladn dlfnd lnv',
              "body": 'bar',
              "userId": 1,
            },headers: {
              'Content-type': 'application/json; charset=UTF-8',
            },);
            if(response!=null)
              Get.snackbar(response["title"]??"sdfd", response["body"]??"sdggsdf");
          }, child: Text("Post api")),
        ),
    );
  }
}
