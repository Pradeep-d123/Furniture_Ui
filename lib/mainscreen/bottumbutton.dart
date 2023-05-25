import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nimma_furniture/mainscreen/profile.dart';
import 'package:nimma_furniture/mainscreen/store.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int cindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cindex == 0
          ? Store()
          : cindex == 1
              ? Container(color: Colors.orange)
              : cindex == 2
                  ? Profile()
                  : Container(color: Colors.red),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey)],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: IconButton(
                    onPressed: () {
                      cindex = 0;

                      setState(() {});
                    },
                    icon: Icon(Icons.store,
                        color: cindex == 0 ? Colors.orange : Colors.grey,
                        size: 45)),
              ),
              Expanded(
                child: IconButton(
                    onPressed: () {
                      cindex = 1;
                      setState(() {});
                    },
                    icon: Icon(Icons.shopping_bag,
                        color: cindex == 1 ? Colors.orange : Colors.grey,
                        size: 45)),
              ),
              Expanded(
                child: IconButton(
                    onPressed: () {
                      cindex = 2;
                      setState(() {});
                    },
                    icon: Icon(Icons.person,
                        color: cindex == 2 ? Colors.orange : Colors.grey,
                        size: 45)),
              ),
              Expanded(
                child: IconButton(
                    onPressed: () {
                      cindex = 3;
                      setState(() {});
                    },
                    icon: Icon(Icons.more_horiz,
                        color: cindex == 3 ? Colors.orange : Colors.grey,
                        size: 45)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
