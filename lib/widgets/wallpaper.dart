import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wpmgr/classes/wallpaperImage.dart';
import 'package:wpmgr/widgets/wpPreview.dart';

Widget wallpapersList(
    {required List<WallpaperImage> wallpaperImageList, context}) {
  return GridView.count(
    crossAxisCount: 3,
    childAspectRatio: 0.666667,
    physics: const ClampingScrollPhysics(),
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
                                    avg_color: image.avg_color,
                                  )))
                    },
                child: Hero(
                    tag: image.source.portraitURL,
                    child: Image.network(image.source.portraitURL))));
      })
    ],
  );
}
