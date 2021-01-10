import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerScreen extends StatefulWidget {
  String videoId;
  YoutubePlayerScreen({this.videoId});
  @override
  _YoutubePlayerScreenState createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(elevation: 0),
      body: SafeArea(
              child: YoutubePlayerBuilder(
    player: YoutubePlayer(
          controller: YoutubePlayerController(
    initialVideoId: widget.videoId,
    flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
    ),
),
    ),
    builder: (context, player){
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
