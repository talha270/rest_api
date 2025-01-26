import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rest_api_tutorial/post/imagecontroller.dart';

class Imagepost extends StatelessWidget {
  final controller = Get.put(Imagecontroller());
  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post images"),
      ),
      body: Column(
        children: [
          Obx(
            ()=> GestureDetector(
              onTap: () {
                pickimage();
              },
              child: Container(
                child: controller.imagepath.value.isEmpty? Center(
                        child: Text("pick image"),
                      )
                    : Image.file(
                        File(controller.imagepath.value).absolute,
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(
            width: Get.width,
            child: ElevatedButton(onPressed: () {
              uploadimage();
            },
                child: Text("Upload")),
          )
        ],
      ),
    );
  }

  pickimage() async {
    XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      controller.imagepath.value = picked.path;
    } else {
      print("image not selected");
    }
  }

  uploadimage() async {
    controller.loading.value = true;
    var stream = http.ByteStream(File(controller.imagepath.value).openRead());
    // stream.cast(): Ensures the stream type is correctly inferred (generally optional here)
    stream.cast();
    // Retrieves the size (in bytes) of the image file. This is required for creating the MultipartFile.
    var length=await File(controller.imagepath.value).length();
    
    var uri=Uri.parse("https://fakestoreapi.com/products");

    var request=http.MultipartRequest("POST",uri);

    request.fields["title"]="static title";

    var multipart=http.MultipartFile("image",stream,length);

    request.files.add(multipart);

    var response=await request.send();
    if(response.statusCode==200){
      print("image is uploaded");
    }else{
      print("error");
    }
    controller.loading.value=false;
  }
}

//upload multiple images
// Future<void> uploadImages(List<String> imagePaths) async {
//   try {
//     // Show loading indicator
//     controller.loading.value = true;
//
//     // Prepare the URL for the request
//     var uri = Uri.parse("https://fakestoreapi.com/products");
//
//     // Create a multipart request
//     var request = http.MultipartRequest("POST", uri);
//
//     // Loop through the list of image paths and add each image to the request
//     for (var path in imagePaths) {
//       var file = File(path);
//       var stream = http.ByteStream(file.openRead());
//       var length = await file.length();
//
//       // Add each file as a multipart field
//       var multipartFile = http.MultipartFile("images", stream, length,
//           filename: path.split("/").last); // Extract filename from path
//
//       request.files.add(multipartFile);
//     }
//
//     // Send the request
//     var response = await request.send();
//
//     // Check the response status
//     if (response.statusCode == 200) {
//       print("Images uploaded successfully!");
//     } else {
//       print("Upload failed. Status code: ${response.statusCode}");
//     }
//   } catch (e) {
//     print("Error uploading images: $e");
//   } finally {
//     // Hide loading indicator
//     controller.loading.value = false;
//   }
// }