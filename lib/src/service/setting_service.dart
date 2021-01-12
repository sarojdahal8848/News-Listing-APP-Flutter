import 'package:http/http.dart' as http;
import 'package:paailaNews/src/common.dart';
import 'package:paailaNews/src/model/setting_model.dart';


class SettingService{
  // ignore: missing_return
  static Future<SettingtModel> getsetting() async {
    try{
      final response = await http.get(
        Uri.encodeFull(BaseUrlProduction+'/setting'),
        headers: {
          'Accept':'application/json',
          'Content-Type':'application/json'
        }
      );
      if(response.statusCode==200){
        return settingtModelFromJson(response.body);
      }else{
        print('erorr setting ');
      }
    }catch (e){
      print('setting  exception');
    }
  }
}