import 'package:http/http.dart' as http;
import 'package:paailaNews/src/common.dart';
import 'package:paailaNews/src/model/category_list_model.dart';


class CategoryListService{
  // ignore: missing_return
  static Future<List<CategoryListModel>> getCategoryList(String id) async {
    try{
      final response = await http.get(
        Uri.encodeFull(BaseUrlProduction+'by-media/category/'+id),
        headers: {
          'Accept':'application/json',
          'Content-Type':'application/json'
        }
      );
      if(response.statusCode==200){
        return categoryListModelFromJson(response.body);
      }else{
        print('erorr category list');
      }
    }catch (e){
      print('category list exception');
    }
  }
}