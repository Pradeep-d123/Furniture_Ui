import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Singup extends StatefulWidget {
  const Singup({super.key});

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0, 2))]),
      child: TextField(
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        decoration:
            InputDecoration(hintText: "Phone Number", border: InputBorder.none),
      ),
    );
  }
}
