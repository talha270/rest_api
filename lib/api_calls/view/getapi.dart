import 'package:api_calls/controller/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import'package:cached_network_image/cached_network_image.dart';

class Getapi extends StatelessWidget {
  Getapi({super.key});
  final controller=Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get API"),
      ),
      body: FutureBuilder(
        future: controller.getapi(url: "https://api.pexels.com/v1/curated?per_page=80",
          headers: {"Authorization":"HaynMm2QE9jEjsGioi1ZocWp4J8TQgusFwQTOiTe0Mn47UqP4xiN25Qy"}),
          builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if(snapshot.hasError){
            return  Center(child: Text("Error: ${snapshot.error}"));
          }else if(snapshot.hasData){

            final data=(snapshot.data as Map<String,dynamic>)["photos"];
            return  GridView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return SizedBox(
                height: index % 2 == 0 ? 100 : 200,  // Ensure height constraint
                  width: Get.width * 0.5,
                child: CachedNetworkImage(
                  imageUrl: data[index]["src"]["original"],
                  fit: BoxFit.fill,
                ),
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
