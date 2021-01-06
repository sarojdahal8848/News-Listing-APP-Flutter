import 'package:flutter/material.dart';
import 'package:paailaNews/src/model/media_list_model.dart';
import 'package:paailaNews/src/service/regional_media_list_service.dart';
import 'package:paailaNews/src/widgets/home/media_list.dart';


class RegionalMedia extends StatefulWidget {
  @override
  _RegionalMediaState createState() => _RegionalMediaState();
}

class _RegionalMediaState extends State<RegionalMedia> {
  Future<List<MediaListModel>> _mediaList;
  @override
  void initState() {
    _mediaList = RegionalMediaListService.getRegionalMediaList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MediaListModel>>(
      future: _mediaList,
      builder: (context, snapshot) {
      
        if(snapshot.hasData){
          List<MediaListModel> _itemList = snapshot.data;
          return GridView.builder(
            itemCount: snapshot.data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            // ignore: missing_return
            itemBuilder: (context, index) {
                return MediaList(
              name: _itemList[index].name,
              image:
                  _itemList[index].imageUrl,
              id: _itemList[index].id.toString(),
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
    );
  }
}