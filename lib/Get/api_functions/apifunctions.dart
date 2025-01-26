import 'dart:convert';

import'package:http/http.dart'as http;

import '../model/complex_model.dart';
import '../model/gets_model.dart';

Future<List> getpostapi({required bool iscomplex,required String url})async{
  final response=await http.get(Uri.parse(url));
  var data=jsonDecode(response.body.toString());
  if(!iscomplex){
    List<GetsModel>temp=[];
    if(response.statusCode==200){
      for(Map i in data){
        temp.add(GetsModel.fromJson(i));
      }
      return temp;
    }else{
      return temp;
    }
  }else{
    var temp=<ComplexModel>[];
    if(response.statusCode==200){
      for(Map i in data){
        temp.add(ComplexModel.fromJson(i));
      }
      return temp;
    }else{
      return temp;
    }
  }
}