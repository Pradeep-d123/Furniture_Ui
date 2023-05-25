import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nimma_furniture/api.dart';
import 'package:nimma_furniture/login.dart';
import 'package:http/http.dart' as http;
import 'package:nimma_furniture/mainscreen/bottumbutton.dart';
import 'package:nimma_furniture/models/listapi.dart';
import 'package:nimma_furniture/models/user_model.dart';
import 'package:nimma_furniture/models/usermodel2.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Myscreen());
  }
}

class Myscreen extends StatelessWidget {
  const Myscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser == null ? Home() : MainScreen();
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orange, Colors.deepOrange],
                  stops: [0.0, 0.7],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 150),
              Center(
                  child: Text(
                "ONLINE FURNITURE \n STORE",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 35,
                    height: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 65),
                child: Image.network(
                    "https://clipartspub.com/images/sofa-clipart-bed-5.png"),
              ),
              SizedBox(height: 150),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SingUp()));
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)),
                  child: Center(
                      child: Text(
                    "Get Started",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Dont Have a Account?",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SingUp()));
                },
                child: Text("Sign in here",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
