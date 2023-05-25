import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nimma_furniture/mainscreen/bottumbutton.dart';
import 'package:http/http.dart' as http;

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  bool isphoneValid = true;
  bool isInSignin = true;
  bool isPasswordValid = true;
  bool isEmailIdValid = true;
  bool isAllFeildValid = true;
  bool isUserDetailValid = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Center(
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.grey)]),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          isInSignin = false;
                          setState(() {});
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              color: !isInSignin ? Colors.grey : Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              border: Border.all(color: Colors.black)),
                          child: Center(
                              child: Text(
                            "Log in",
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.purple,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          isInSignin = true;
                          setState(() {});
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              color: isInSignin ? Colors.grey : Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              border: Border.all(color: Colors.black)),
                          child: Center(
                            child: Text("Sign Up",
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (!isAllFeildValid)
                Text(
                  "Please enter all feild",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.red),
                ),
              SizedBox(height: 50),
              if (isInSignin)
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey, offset: Offset(0, 2))
                      ]),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: nameController,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    decoration: InputDecoration(
                        hintText: "Name", border: InputBorder.none),
                  ),
                ),
              SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey, offset: Offset(0, 2))
                    ]),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  decoration: InputDecoration(
                      hintText: "Email Id", border: InputBorder.none),
                ),
              ),
              if (!isEmailIdValid)
                Text("Please Enter correct Email Id",
                    style: TextStyle(color: Colors.red)),
              SizedBox(height: 50),
              Text(
                "Password",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey, offset: Offset(0, 2))
                    ]),
                child: TextField(
                  controller: passwordController,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              if (!isPasswordValid)
                Text("Please Enter Correct password",
                    style: TextStyle(color: Colors.red)),
              SizedBox(height: 30),
              if (isInSignin)
                Text(
                  "Phone number",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
              if (isInSignin)
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey, offset: Offset(0, 2))
                      ]),
                  child: TextField(
                    controller: phoneNumberController,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              if (!isUserDetailValid)
                Text(
                  "User detailes incorrect",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
                ),
              SizedBox(height: 90),
              Center(
                child: InkWell(
                  onTap: () async {
                    if (isInSignin) {
                      if (nameController.text.trim() != "" &&
                          emailController.text.trim().endsWith("@gmail.com") &&
                          passwordController.text.length >= 10 &&
                          phoneNumberController.text.trim().length == 10) {
                        isAllFeildValid = true;

                        setState(() {});
                        try {
                          UserCredential user = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);
                          user.user?.updateDisplayName(nameController.text);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())));
                        }
                      } else {
                        print("not sucsed");
                        isAllFeildValid = false;
                        setState(() {});
                      }
                    } else {
                      if (emailController.text.trim().endsWith("@gmail.com") &&
                          passwordController.text.length >= 10) {
                        isAllFeildValid = true;
                        setState(() {});
                        try {
                          UserCredential User = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MainScreen();
                          }));
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())));
                        }
                      } else {
                        isAllFeildValid = false;

                        setState(() {});
                      }
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.deepOrange, Colors.orange],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          !isInSignin ? "Log in" : "Sign in",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      )),
                ),
              ),
              SizedBox(height: 10),
              if (!isInSignin)
                Center(
                    child: Text(
                  "Forget Your Pasword ?",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.purple),
                )),
            ],
          ),
        ),
      ),
    );
  }
}
