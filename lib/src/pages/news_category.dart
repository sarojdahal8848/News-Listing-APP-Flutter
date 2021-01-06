import 'package:flutter/material.dart';
import 'package:paailaNews/src/common.dart';
import 'package:paailaNews/src/model/category_list_model.dart';
import 'package:paailaNews/src/service/category_list_service.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class NewsCategory extends StatefulWidget {
  String id;
  NewsCategory({this.id});
  @override
  _NewsCategoryState createState() => _NewsCategoryState();
}

class _NewsCategoryState extends State<NewsCategory> {
  Future <List<CategoryListModel>> _categoryList;
  @override
  void initState() {
    _categoryList = CategoryListService.getCategoryList(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: FutureBuilder<List<CategoryListModel>>(
        future: _categoryList,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<CategoryListModel> _listItem = snapshot.data;
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                      Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                onTap: () {
                  return _launchNewsUrl(_listItem[index].newsUrl);
                },
                  child: ListTile(
                  title: Text(_listItem[index].title,style: TextStyle(fontWeight:FontWeight.w600),),
                  trailing: Icon(Icons.arrow_right,color:red),
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