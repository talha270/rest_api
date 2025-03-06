import 'package:api_calls/controller/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondGet extends StatelessWidget {
  SecondGet({super.key});
  final controller=Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Get API"),
        ),
        body: FutureBuilder(
          future: controller.getapi(url: "https://jsonplaceholder.typicode.com/posts",),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else if(snapshot.hasError){
              return  Center(child: Text("Error: ${snapshot.error}"));
            }else if(snapshot.hasData){

              final data=snapshot.data as List;
              return  ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(data[index]["id"].toString()),
                    ),
                    title:Text( data[index]["title"]),
                    subtitle: Text(data[index]["body"]),
                  );
                },);

            }else{
              return Center(
                child: Text("no data"),
              );

            }
          },)
    );
  }
}
