import 'dart:convert';

import 'package:wpmgr/classes/wallpaper_image.dart';
import 'package:http/http.dart' as http;

class PicsUpdater{

  static Future<List<WallpaperImage>> getWPPics(String url) async {
    String pexelAPIKey = "563492ad6f91700001000001f19e0fde9c284d91a33407f215c46a60";
    List<WallpaperImage> wallpaperImageList = [];
    var response = await http.get(url, headers: {"Authorization": pexelAPIKey});
    Map<String, dynamic> wpImages = jsonDecode(response.body);

    wpImages['photos'].forEach((photo) {
      WallpaperImage wallpaperImage = WallpaperImage.fromMap(photo);
      wallpaperImageList.add(wallpaperImage);
    }
    );
    return wallpaperImageList;
}
}