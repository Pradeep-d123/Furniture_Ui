import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:nimma_furniture/models/listusermodel.dart';

class ApiCall extends StatelessWidget {
  const ApiCall({super.key});
  Future<ListUsers> featch() async {
    final http.Response response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));

    final json = jsonDecode(response.body);

    final listuser = ListUsers.fromJson(json);

    return listuser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: featch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(child: Text("Please try agin"));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(70)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(80),
                                  child: Image.network(
                                      snapshot.data?.data?[index].image ?? "")),
                            ),
                            SizedBox(width: 25),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${(snapshot.data?.data?[index].firstName ?? "")} ${(snapshot.data?.data?[index].lastName ?? "")}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                Text(
                                  snapshot.data?.data?[index].email ?? "",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
