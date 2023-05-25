import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:nimma_furniture/models/user_model.dart';
import 'package:nimma_furniture/models/usermodel2.dart';

class NewApi extends StatefulWidget {
  const NewApi({super.key});

  @override
  State<NewApi> createState() => _NewApiState();
}

class _NewApiState extends State<NewApi> {
  Future<UserModel2?> featch() async {
    print("api startted");
    final http.Response response = await http.put(
        Uri.parse(
            "https://run.mocky.io/v3/ff3c7637-135f-43cb-aac0-bf2b36922cdc"),
        body: jsonEncode({"email": "", "password": ""}));
    print("above");
    print(response.body);

    final json = jsonDecode(response.body);
    print(json);

    UserModel2 userModel = UserModel2.fromjson(json);
    
    return userModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: featch(),
            builder: (context, snapshot) {
              
              

              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                      child: Text("Someting went wrng. plz try again!"));
                } else if (snapshot.hasData) {
                  return Column(children: [
                    SizedBox(height: 50),
                    Text(snapshot.data?.name ?? ""),
                    Text(snapshot.data?.age?.toString() ?? ""),
                    Text(snapshot.data?.email ?? "Email Id Empty"),
                  ]);
                } else {
                  return Center(child: Text("No data"));
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
