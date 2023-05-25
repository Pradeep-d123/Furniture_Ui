import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nimma_furniture/mainscreen/itemcard.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  int quntity = 1;
  double price = 500;
  double singleUnitprice = 500;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.orange, Colors.deepOrangeAccent],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all()),
                child: TextField(
                    decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(bottom: 5, top: 4),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 20,
                  ),
                )),
              ),
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return ItemCArd();
            }),
          )
        ],
      ),
    );
  }
}
