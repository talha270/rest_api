import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Putandpatch extends StatelessWidget {
  const Putandpatch({super.key});
  putmethod()async{
    var response=await http.put(Uri.parse("https://fakestoreapi.com/products/1"),
    body: {
      "title":"tech"
    });
    if(response.statusCode==200){
      print("updated");
    }else{
      print("error");
    }
  }
  patchmethod()async{
    var response=await http.patch(Uri.parse("https://fakestoreapi.com/products/1"),
        body: {
          "title":"tech"
        });
    if(response.statusCode==200){
      print("updated");
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
            // putmethod();
            patchmethod();
        }, child: Text("put and patch")),
      ),
    );
  }
}

