import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nimma_furniture/main.dart';
import 'package:nimma_furniture/mainscreen/camera.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ValueNotifier<int> currentMessageCount = ValueNotifier(0);
  ValueNotifier<int> currentNotificationCount = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (Context) {
                  return Camera();
                }));
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.2),
                    borderRadius: BorderRadius.circular(100)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.network(
                      fit: BoxFit.fill,
                      "https://cdn.fstoppers.com/styles/full/s3/media/2017/09/10/1_use_psychology_to_take_better_photographs.jpeg"),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              FirebaseAuth.instance.currentUser?.displayName ?? "",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 80),
            InkWell(
              onDoubleTap: () {
                currentMessageCount.value = currentMessageCount.value - 1;
              },
              onTap: () {
                currentMessageCount.value = currentMessageCount.value + 1;
              },
              child: Row(
                children: [
                  Icon(Icons.mail, color: Colors.grey, size: 35),
                  SizedBox(width: 20),
                  Text("Messages", style: TextStyle(fontSize: 25)),
                  SizedBox(width: 100),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.orange),
                    child: Center(
                        child: ValueListenableBuilder(
                            valueListenable: currentMessageCount,
                            builder: (context, value, _) {
                              return Text(
                                value.toString(),
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              );
                            })),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 260,
              decoration: BoxDecoration(border: Border.all(width: 0.2)),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                currentNotificationCount.value =
                    currentNotificationCount.value + 1;
              },
              child: Row(
                children: [
                  Icon(Icons.notifications, color: Colors.grey, size: 35),
                  SizedBox(width: 20),
                  Text("Notification", style: TextStyle(fontSize: 25)),
                  SizedBox(width: 80),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.orange),
                    child: Center(
                        child: ValueListenableBuilder(
                      valueListenable: currentNotificationCount,
                      builder: (context, value, _) {
                        return Text(
                          value.toString(),
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        );
                      },
                    )),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 260,
              decoration: BoxDecoration(border: Border.all(width: 0.2)),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.person, color: Colors.grey, size: 35),
                SizedBox(width: 20),
                Text("Account Detailes", style: TextStyle(fontSize: 25)),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: 260,
              decoration: BoxDecoration(border: Border.all(width: 0.2)),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.shopping_cart, color: Colors.grey, size: 35),
                SizedBox(width: 20),
                Text("My purchases", style: TextStyle(fontSize: 25)),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: 260,
              decoration: BoxDecoration(border: Border.all(width: 0.2)),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.settings, color: Colors.grey, size: 35),
                SizedBox(width: 20),
                Text("Account Detailes", style: TextStyle(fontSize: 25)),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: 260,
              decoration: BoxDecoration(border: Border.all(width: 0.2)),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return Home();
                }), (route) => false);
              },
              child: Row(
                children: [
                  Icon(Icons.logout, color: Colors.grey, size: 35),
                  SizedBox(width: 20),
                  Text("Log out", style: TextStyle(fontSize: 25)),
                ],
              ),
            ),
            Divider(
                thickness: 0.5, endIndent: 40, color: Colors.black, indent: 40),
          ],
        ),
      ),
    );
  }
}
