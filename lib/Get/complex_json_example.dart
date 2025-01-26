import 'package:flutter/material.dart';

import 'api_functions/apifunctions.dart';

class ComplexJsonExample extends StatelessWidget {
  const ComplexJsonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("complex Api tutorial"),
      ),
      body: FutureBuilder(
        future: getpostapi(
            iscomplex: true,
            url: "https://jsonplaceholder.typicode.com/users"),
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
                      data![index].name.toString(),
                      style: TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                    subtitle: Text(
                      data![index].address.street.toString(),
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
