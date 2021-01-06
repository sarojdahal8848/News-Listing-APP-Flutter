import 'package:flutter/material.dart';
import 'package:paailaNews/src/common.dart';
// import 'package:paailaNews/src/common.dart';
import 'package:paailaNews/src/widgets/home/drawer.dart';
import 'package:paailaNews/src/widgets/home/national_media.dart';
import 'package:paailaNews/src/widgets/home/regional_media.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaailaNews'),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: HomeDrawer(),

      body: ListView(
          children: <Widget>[
            Material(
              color: Colors.red,
              child: TabBar(
                unselectedLabelColor: white,
                labelColor: yellow,
                indicatorColor: Colors.yellow,
                // indicatorColor: Colors.white,
                indicatorWeight: 5,
                // labelColor: white,
                controller: controller,
                tabs: <Widget>[
                  Tab(
                child: Text(
                  "National",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  "Regional",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              // Tab(
              //   child: Text(
              //     "video",
              //     style: TextStyle(fontWeight: FontWeight.bold),
              //   ),
              // ),
              // Tab(
              //   child: Text(
              //     "video",
              //     style: TextStyle(fontWeight: FontWeight.bold),
              //   ),
              // ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.78,
              child: TabBarView(
                controller: controller,
                children: <Widget>[NationalMedia(),RegionalMedia()],
              ),
            ),
          ],
        ),
    );
  }
}
