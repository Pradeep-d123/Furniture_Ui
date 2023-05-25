import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ItemCArd extends StatefulWidget {
  const ItemCArd({super.key});

  @override
  State<ItemCArd> createState() => _ItemCArdState();
}

class _ItemCArdState extends State<ItemCArd> {
  int quntity = 1;
  double price = 500;
  double singleUnitprice = 500;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25).copyWith(top: 0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.3),
              offset: Offset(0, 4),
              spreadRadius: 0.8)
        ], color: Colors.white),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network("http://www.pngall.com/wp-content/uploads/4/Sofa.png",
                height: 100, width: 100),
            Column(
              children: [
                Text(
                  "Sofa",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          if (quntity > 1) {
                            quntity = quntity - 1;
                            price = singleUnitprice * quntity;

                            setState(() {});
                          }
                        },
                        icon: Icon(Icons.remove)),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Center(
                        child: Text(
                          quntity.toString(),
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          if (quntity < 9) {
                            quntity = quntity + 1;
                            price = singleUnitprice * quntity;
                            setState(() {});
                          }
                        },
                        icon: Icon(Icons.add))
                  ],
                ),
              ],
            ),
            Text(
              "$price",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
