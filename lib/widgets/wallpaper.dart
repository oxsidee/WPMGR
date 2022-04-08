import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wpmgr/classes/wallpaperImage.dart';

String pexelAPIKey = "563492ad6f91700001000001f19e0fde9c284d91a33407f215c46a60";

Widget walpaperslist({required List<WallpaperImage> wallpaperImageList, context}){
  return Container(
    child: GridView.count(crossAxisCount: 3,
      childAspectRatio: 0.666667,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      children: [...wallpaperImageList.map((image){
        return GridTile(child: InkWell(
            onTap: () => {
              print(image.source.portraitURL)
            },
            child: Image.network(image.source.portraitURL)));
      })],
    ),
  );
}