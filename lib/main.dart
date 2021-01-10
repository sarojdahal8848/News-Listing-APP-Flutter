import 'package:flutter/material.dart';

import 'package:paailaNews/src/common.dart';
import 'package:paailaNews/src/model/setting_model.dart';

import 'package:paailaNews/src/pages/home.dart';
import 'package:paailaNews/src/service/setting_service.dart';

import 'package:splashscreen/splashscreen.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.blue,
  //   ),
  // );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paaila News',
      theme: ThemeData(
        primarySwatch: green,
        // brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        seconds: 8,
        navigateAfterSeconds: Home(),
        title: Text(
          'Paaila News',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        image: Image.network(
            'https://paailajob.com/assets/public/img/paaila-job.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 100.0,
        loadingText: Text(
          'Powered by PaailaTech - 2021',
          style:
              TextStyle(color: grey, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        loaderColor: Colors.green,
      ),
    );
  }
}
