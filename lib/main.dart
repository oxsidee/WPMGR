// @dart=2.9
import 'dart:convert';
import 'package:wpmgr/classes/wallpaperImage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wpmgr/widgets/tabs.dart';

String pexelAPIKey = "563492ad6f91700001000001f19e0fde9c284d91a33407f215c46a60";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: const Color.fromRGBO(255, 255, 255, .1),
      100: const Color.fromRGBO(255, 255, 255, .2),
      200: const Color.fromRGBO(255, 255, 255, .3),
      300: const Color.fromRGBO(255, 255, 255, .4),
      400: const Color.fromRGBO(255, 255, 255, .5),
      500: const Color.fromRGBO(255, 255, 255, .6),
      600: const Color.fromRGBO(255, 255, 255, .7),
      700: const Color.fromRGBO(255, 255, 255, 0.8),
      800: const Color.fromRGBO(255, 255, 255, .9),
      900: const Color.fromRGBO(255, 255, 255, 1),
    };
    return MaterialApp(
      title: 'WallPaper Manager',
      theme: ThemeData(
        //Color(0xFF232323)
        primarySwatch: MaterialColor(0xFF151515, color),
        scaffoldBackgroundColor: MaterialColor(0xFF101010, color),
      ),
      home: const MyHomePage(title: 'WallPaper Manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({key, this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<WallpaperImage> wallpaperImageListPopular = [];
  List<WallpaperImage> wallpaperImageListArt = [];
  List<WallpaperImage> wallpaperImageListCars = [];
  List<WallpaperImage> wallpaperImageListNature = [];
  List<WallpaperImage> wallpaperImageListGirls = [];
  List<WallpaperImage> wallpaperImageListCities = [];

  getWPPics(String url, int category) async {
    var response = await http.get(url, headers: {"Authorization": pexelAPIKey});
    Map<String, dynamic> wpImages = jsonDecode(response.body);

    wpImages['photos'].forEach((photo) {
      WallpaperImage wallpaperImage = WallpaperImage.fromMap(photo);

      switch (category) {
        case 1:
          wallpaperImageListPopular.add(wallpaperImage);
          break;
        case 2:
          wallpaperImageListArt.add(wallpaperImage);
          break;
        case 3:
          wallpaperImageListCars.add(wallpaperImage);
          break;
        case 4:
          wallpaperImageListNature.add(wallpaperImage);
          break;
        case 5:
          wallpaperImageListGirls.add(wallpaperImage);
          break;
        case 6:
          wallpaperImageListCities.add(wallpaperImage);
          break;
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    int countPerPage = 72;
    // TODO: implement initState
    super.initState();
    getWPPics(
        'https://api.pexels.com/v1/curated?per_page=$countPerPage&page=1', 1);
    getWPPics(
        'https://api.pexels.com/v1/search?query=art&per_page=$countPerPage&page=1',
        2);
    getWPPics(
        'https://api.pexels.com/v1/search?query=cars&per_page=$countPerPage&page=1',
        3);
    getWPPics(
        'https://api.pexels.com/v1/search?query=nature&per_page=$countPerPage&page=1',
        4);
    getWPPics(
        'https://api.pexels.com/v1/search?query=girls&per_page=$countPerPage&page=1',
        5);
    getWPPics(
        'https://api.pexels.com/v1/search?query=cities&per_page=$countPerPage&page=1',
        6);
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 6, vsync: this);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 130, 0, 50),
            child: tabs(
                _tabController,
                wallpaperImageListPopular,
                wallpaperImageListArt,
                wallpaperImageListCars,
                wallpaperImageListNature,
                wallpaperImageListGirls,
                wallpaperImageListCities,
                context),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
