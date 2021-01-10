import 'package:http/http.dart' as http;

import 'package:paailaNews/src/model/youtube_trending_video_model.dart';

class YoutubeTrendingVideoService{
  // ignore: missing_return
  static Future<List<YoutubeTrendingVideoModel>> getYoutubeTrendingVideo() async {
    try{
      final response = await http.get(
        Uri.encodeFull('http://192.168.1.118:8000/api/youtube-video'),
        headers: {
          'Accept':'application/json',
          'Content-Type':'application/json'
        }
      );
      if(response.statusCode==200){
        return youtubeTrendingVideoModelFromJson(response.body);
      }else{
        print('youtube trending video list');
      }
    }catch (e){
      print('youtube trending video exception');
    }
  }
}