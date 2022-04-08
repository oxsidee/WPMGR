import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:wpmgr/classes/wallpaperImage.dart';
import 'package:wpmgr/widgets/wallpaper.dart';

String pexelAPIKey = "563492ad6f91700001000001f19e0fde9c284d91a33407f215c46a60";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color =
    {
      50:Color.fromRGBO(255,255,255, .1),
      100:Color.fromRGBO(255,255,255, .2),
      200:Color.fromRGBO(255,255,255, .3),
      300:Color.fromRGBO(255,255,255, .4),
      400:Color.fromRGBO(255,255,255, .5),
      500:Color.fromRGBO(255,255,255, .6),
      600:Color.fromRGBO(255,255,255, .7),
      700:Color.fromRGBO(255,255,255, .8),
      800:Color.fromRGBO(255,255,255, .9),
      900:Color.fromRGBO(255,255,255, 1),
    };
    return MaterialApp(
      title: 'WallPaper Manager',
      theme: ThemeData(
        //Color(0xFF232323)
        primarySwatch: MaterialColor(0xFF232323, color),
        scaffoldBackgroundColor: MaterialColor(0xFF101010, color),

      ),
      home: const MyHomePage(title: 'WallPaper Manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> wallpapers = [];
  List<WallpaperImage> wallpaperImageList = [];
  getMainWPPics() async{
    var response = await http.get("https://api.pexels.com/v1/curated?per_page=30&page=1",
    headers: {
      "Authorization": pexelAPIKey
    }
    );
    Map<String, dynamic> wpImages = jsonDecode(response.body);

    wpImages['photos'].forEach((photo){
    WallpaperImage wallpaperImage = WallpaperImage.fromMap(photo);
    wallpaperImageList.add(wallpaperImage);

    });

    setState(() {});

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMainWPPics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[walpaperslist(wallpaperImageList: wallpaperImageList, context: context)],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


