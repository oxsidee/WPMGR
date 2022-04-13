class WallpaperImage {
  Src source;
  String avgcolor;

  WallpaperImage({required this.source, required this.avgcolor});

  factory WallpaperImage.fromMap(Map<String, dynamic> json) {
    return WallpaperImage(
        source: Src.fromMap(json['src']), avgcolor: json['avg_color']);
  }
}

class Src {
  String portraitURL;
  String smallURL;

  Src({required this.portraitURL, required this.smallURL});

  factory Src.fromMap(Map<String, dynamic> json) {
    return Src(portraitURL: json['portrait'], smallURL: json['medium']);
  }
}
