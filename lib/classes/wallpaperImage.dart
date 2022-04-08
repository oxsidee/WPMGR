class WallpaperImage{
  Src source;
  String avg_color;

  WallpaperImage({required this.source, required this.avg_color});

  factory WallpaperImage.fromMap(Map<String, dynamic> json){
    return WallpaperImage(source: Src.fromMap(json['src']), avg_color: json['avg_color']);
  }

}

class Src {
  String portraitURL;
  String smallURL;

  Src({required this.portraitURL,required this.smallURL});

  factory Src.fromMap(Map<String, dynamic> json){
    return Src(portraitURL: json['portrait'], smallURL: json['small']);
  }
}