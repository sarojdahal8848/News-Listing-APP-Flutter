import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerScreen extends StatefulWidget {
  String videoId;
  YoutubePlayerScreen({this.videoId});
  @override
  _YoutubePlayerScreenState createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['news', 'sports', 'games'],
    nonPersonalizedAds: true,
    testDevices: <String>[], // Android emulators are considered test devices
  );

  InterstitialAd _createAd;

  InterstitialAd creatInterstitialAd() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );
  }
  @override
  void initState() {
    FirebaseAdMob.instance.initialize(appId: InterstitialAd.testAdUnitId);
    _createAd = creatInterstitialAd()..load()..show();
    super.initState();
  }
  @override
  void dispose() {
    _createAd.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(elevation: 0),
      body: SafeArea(
        child: 
            YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: widget.videoId,
                  flags: YoutubePlayerFlags(
                    autoPlay: true,
                    mute: false,
                  ),
                ),
              ),
              builder: (context, player) {
                return Column(
                  children: [
                    // some widgets
                    player,
                    //some other widgets
                  ],
                );
              },
            ),
            
        ),
      
    );
  }
}
