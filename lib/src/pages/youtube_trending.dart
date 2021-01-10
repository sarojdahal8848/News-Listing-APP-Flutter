import 'package:flutter/material.dart';
import 'package:paailaNews/src/model/youtube_trending_video_model.dart';
import 'package:paailaNews/src/pages/youtube_player_screen.dart';
import 'package:paailaNews/src/service/youtube_trending_video_service.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class YoutubeTrending extends StatefulWidget {
  String id;
  YoutubeTrending({this.id});
  @override
  _YoutubeTrendingState createState() => _YoutubeTrendingState();
}

class _YoutubeTrendingState extends State<YoutubeTrending> {
  Future <List<YoutubeTrendingVideoModel>> _videoList;
  @override
  void initState() {
    _videoList = YoutubeTrendingVideoService.getYoutubeTrendingVideo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<YoutubeTrendingVideoModel>>(
        future: _videoList,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<YoutubeTrendingVideoModel> _listItem = snapshot.data;
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                      Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>YoutubePlayerScreen(videoId: _listItem[index].videoId,)));
                },
                  child: ListTile(
                  leading: Container(
                    height: MediaQuery.of(context).size.height*0.1,
                    width: MediaQuery.of(context).size.width*0.25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(_listItem[index].thumbnail),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                  title: Text(_listItem[index].title,style: TextStyle(fontWeight:FontWeight.w600),),
                  
                ),
              ),
            ),
            Divider(),
                  ],
                );
              },
            );
          }else if(snapshot.hasError){
            print('${snapshot.error}');
          }
          return Center(
            child: CircularProgressIndicator(),
          );         
        },
      ), 
    );
  }
  _launchNewsUrl(String urlNews) async {
    final url = urlNews;
    // const url = "https://google.com";
    print(url);
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}