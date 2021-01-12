import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:paailaNews/src/common.dart';
import 'package:paailaNews/src/model/setting_model.dart';
import 'package:paailaNews/src/pages/youtube_trending.dart';
import 'package:paailaNews/src/service/setting_service.dart';
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
  Future<SettingtModel> _settingData;

  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['news', 'sports', 'games'],
    nonPersonalizedAds: true,
    testDevices: <String>[], // Android emulators are considered test devices
  );

  BannerAd _createAd;

  BannerAd createdBannerAd() {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      },
    );
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    _settingData = SettingService.getsetting();
    FirebaseAdMob.instance.initialize(appId: BannerAd.testAdUnitId);
    _createAd =createdBannerAd()..load()..show();
  }

  @override
  void dispose() {
    controller.dispose();
    _createAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<SettingtModel>(
          future: _settingData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              SettingtModel _data = snapshot.data;
              var _newData = _data.data[0];
              return Text(_newData.appName);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: HomeDrawer(),
      body: ListView(
        children: <Widget>[
          Material(
            color: Colors.green,
            child: TabBar(
              unselectedLabelColor: white,
              labelColor: Colors.yellow,
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
                Tab(
                  child: Text(
                    "Video",
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
              children: <Widget>[
                NationalMedia(),
                RegionalMedia(),
                YoutubeTrending()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
