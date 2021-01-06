import 'package:flutter/material.dart';
import 'package:paailaNews/src/common.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              color: red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(35),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://biratnagar.wordcamp.org/2018/files/2018/11/final-logo1-2000x1200.png"))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Paaila News",
                    style: TextStyle(
                        color: white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(
                  Icons.info,
                  color: red,
                ),
                title: Text(
                  "About Us",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(
                  Icons.share,
                  color: red,
                ),
                title: Text(
                  "Share",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(
                  Icons.star,
                  color: red,
                ),
                title: Text(
                  "Rate Us",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(
                  Icons.security,
                  color: red,
                ),
                title: Text(
                  "Privacy Policy",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(
                  Icons.phonelink_lock,
                  color: red,
                ),
                title: Text(
                  "Terms & Conditions",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(
                  Icons.warning,
                  color: red,
                ),
                title: Text(
                  "Disclaimer",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );
  }
}