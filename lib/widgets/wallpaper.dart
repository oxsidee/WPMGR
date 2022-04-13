import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wpmgr/classes/wallpaper_image.dart';
import 'package:wpmgr/widgets/wp_preview.dart';

Widget wallpapersList(
    {required List<WallpaperImage> wallpaperImageList, context}) {
  return GridView.count(
    crossAxisCount: 3,
    childAspectRatio: 0.666667,
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    children: [
      ...wallpaperImageList.map((image) {
        return GridTile(
            child: InkWell(
                onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WpPreview(
                                    src: image.source.portraitURL,
                                    avgcolor: image.avgcolor,
                                  )))
                    },
                child: Hero(
                    tag: image.source.portraitURL,
                    child: Image.network(image.source.smallURL, fit: BoxFit.cover,))));
      })
    ],
  );
}
