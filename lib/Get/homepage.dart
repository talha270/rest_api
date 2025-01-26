import 'package:flutter/material.dart';
import 'api_functions/apifunctions.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api tutorial"),
      ),
      body: FutureBuilder(
        future: getpostapi(
            iscomplex: false,
            url: "https://jsonplaceholder.typicode.com/posts"),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var data = snapshot.data;
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      data![index].title.toString(),
                      style: TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                    subtitle: Text(
                      data![index].body.toString(),
                      style: TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
