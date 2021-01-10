import 'package:flutter/material.dart';
import 'package:paailaNews/src/common.dart';
import 'package:paailaNews/src/model/setting_model.dart';
import 'package:paailaNews/src/service/setting_service.dart';
import 'package:share/share.dart';

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  Future<SettingtModel> _settingData;
  @override
  void initState() {
    _settingData = SettingService.getsetting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<SettingtModel>(
        future: _settingData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            SettingtModel _data = snapshot.data;
            var _newData = _data.data[0];
            // Color appColor =_newData.appColor=='red'?red:_newData.appColor=='blue'?blue:_newData.appColor=='green'?green:red;
            // Colorgreen =_newData.appColor=='red'?red:_newData.appColor=='blue'?blue:_newData.appColor=='green'?green:red;
            // Color app_color = _data.data[0].appColor;
            return ListView(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  color: green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(35),
                            image: DecorationImage(
                                image: NetworkImage(_newData.imageUrl))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        _data.data[0].appName,
                        style: TextStyle(
                            color: white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: green,
                    ),
                    title: Text(
                      "About Us",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _share(context, _data.data[0].shareLink,
                        _data.data[0].shareSubject);
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.share,
                      color: green,
                    ),
                    title: Text(
                      "Share",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(
                      Icons.star,
                      color: green,
                    ),
                    title: Text(
                      "Rate Us",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(
                      Icons.security,
                      color: green,
                    ),
                    title: Text(
                      "Privacy Policy",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(
                      Icons.phonelink_lock,
                      color: green,
                    ),
                    title: Text(
                      "Terms & Conditions",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(
                      Icons.warning,
                      color: green,
                    ),
                    title: Text(
                      "Disclaimer",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  _share(BuildContext context, String link, String subject) async {
    final RenderBox box = context.findRenderObject();
    await Share.share(link,
        subject: subject,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
