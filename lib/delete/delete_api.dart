import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class DeleteApi extends StatelessWidget {
  const DeleteApi({super.key});
  deletemethod()async{
    var response=await http.delete(Uri.parse("https://fakestoreapi.com/products/1"),
    // body: {
    //   "esfd":"efd"
    // }
    );
    if(response.statusCode==200){
      print("deleted");
    }else{
      print("error");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("put and patch"),),
      body: Center(
        child: ElevatedButton(onPressed: () {
         deletemethod();
        }, child: Text("put and patch")),
      ),
    );
  }
}

