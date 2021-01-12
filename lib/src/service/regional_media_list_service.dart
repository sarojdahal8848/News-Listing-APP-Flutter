import 'package:http/http.dart' as http;
import 'package:paailaNews/src/common.dart';
import 'package:paailaNews/src/model/media_list_model.dart';

class RegionalMediaListService{
  // ignore: missing_return
  static Future<List<MediaListModel>> getRegionalMediaList() async {
    try{
      final response = await http.get(
        Uri.encodeFull(BaseUrlProduction+'/media/regional'),
        headers: {
          'Accept':'application/json',
          'Content-Type':'application/json'
        }
      );
      if(response.statusCode==200){
        return mediaListModelFromJson(response.body);
      }else{
        print('erorr media list');
      }
    }catch (e){
      print('media list exception');
    }
  }
}