import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WpPreview extends StatefulWidget {
  final String src;
  final String avg_color;

  WpPreview({required this.src, required this.avg_color});

  @override
  _WpPreviewState createState() => _WpPreviewState();
}

class _WpPreviewState extends State<WpPreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: widget.src,
        child: Stack(
          children: [
            Image.network(
              widget.src,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(
                                int.parse(
                                    'FF' + widget.avg_color.replaceAll('#', ''),
                                    radix: 16)))),
                        onPressed: () => {
                              PicSetter.setPicHome(
                                  widget.src, WallpaperManager.HOME_SCREEN)
                            },
                        child: const Text(
                          'Set on Home screen',
                          style: TextStyle(fontSize: 20),
                        )),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(
                                int.parse(
                                    'FF' + widget.avg_color.replaceAll('#', ''),
                                    radix: 16)))),
                        onPressed: () => {
                              PicSetter.setPicHome(
                                  widget.src, WallpaperManager.LOCK_SCREEN)
                            },
                        child: const Text(
                          'Set on Lock screen',
                          style: TextStyle(fontSize: 20),
                        )),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(
                                int.parse(
                                    'FF' + widget.avg_color.replaceAll('#', ''),
                                    radix: 16)))),
                        onPressed: () => {
                              PicSetter.setPicHome(
                                  widget.src, WallpaperManager.BOTH_SCREENS)
                            },
                        child: const Text(
                          'Set on both screen',
                          style: TextStyle(fontSize: 20),
                        )),
                    OutlinedButton(
                        onPressed: () => {Navigator.pop(context)},
                        child: const Text(
                          'Close',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PicSetter extends _WpPreviewState {
  static setPicHome(url, location) async {
    var file = await DefaultCacheManager().getSingleFile(url);
    final String success =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
    if (success == 'Wallpaper set') {
      Fluttertoast.showToast(
          msg: "Wallpaper set",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Somethings wrong. Try later...",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }
}
