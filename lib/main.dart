import 'package:flutter/material.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'SMTH HERE',
            ),
            ElevatedButton(
                onPressed: () => { picSetter.setPicHome()}
                , child: const Text('Home')),
            ElevatedButton(
                onPressed: () => { picSetter.setPicLock()}
                , child: const Text('lock')),
            ElevatedButton(
                onPressed: () => { picSetter.setPicBoth()}
                , child: const Text('Both')),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class picSetter extends _MyHomePageState {
  static setPicHome() async {
      String url = "https://sun9-81.userapi.com/impf/RUvaMuytmhW2U4jDvlHOFs52m3nxjUS-pagKcA/lM_NYoN3kf4.jpg?size=1080x1227&quality=96&sign=1bfe106cc90468a9c8392bcd930bd45e&type=album";
      int location = WallpaperManager.HOME_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
      String result;
      var file = await DefaultCacheManager().getSingleFile(url);
      final String success = await WallpaperManager.setWallpaperFromFile(file.path, location);
  }
  static setPicLock() async {
    String url = "https://sun9-81.userapi.com/impf/RUvaMuytmhW2U4jDvlHOFs52m3nxjUS-pagKcA/lM_NYoN3kf4.jpg?size=1080x1227&quality=96&sign=1bfe106cc90468a9c8392bcd930bd45e&type=album";
    int location = WallpaperManager.LOCK_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
    String result;
    var file = await DefaultCacheManager().getSingleFile(url);
    final String success = await WallpaperManager.setWallpaperFromFile(file.path, location);
  }
  static setPicBoth() async {
    String url = "https://sun9-81.userapi.com/impf/RUvaMuytmhW2U4jDvlHOFs52m3nxjUS-pagKcA/lM_NYoN3kf4.jpg?size=1080x1227&quality=96&sign=1bfe106cc90468a9c8392bcd930bd45e&type=album";
    int location = WallpaperManager.BOTH_SCREENS; // or location = WallpaperManager.LOCK_SCREEN;
    String result;
    var file = await DefaultCacheManager().getSingleFile(url);
    final String success = await WallpaperManager.setWallpaperFromFile(file.path, location);
  }
}

