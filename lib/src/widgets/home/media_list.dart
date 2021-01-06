import 'package:flutter/material.dart';
import 'package:paailaNews/src/common.dart';
import 'package:paailaNews/src/pages/news_category.dart';


// ignore: must_be_immutable
class MediaList extends StatefulWidget {
  String image;
  String name;
  String id;
  MediaList({this.image, this.name, this.id});
  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // return _launchNewsUrl(widget.newsUrl);
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsCategory(id: widget.id)));
      },
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                // width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    // color: red,
                    image: DecorationImage(
                        image: NetworkImage(widget.image), fit: BoxFit.fill)),
              ),
              SizedBox(height: 10),
              Text(
                widget.name,
                style: TextStyle(
                    color: grey, fontWeight: FontWeight.bold, fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}
