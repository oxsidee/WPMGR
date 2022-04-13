import 'package:flutter/material.dart';
import 'package:wpmgr/classes/wallpaper_image.dart';

abstract class  PicsState {}

class PicsEmptyState extends PicsState {}

class PicsLoadingState extends PicsState {}

class PicsLoadedState extends PicsState {

  TabController tabController;

  List<WallpaperImage> wallpaperImageListPopular;

  List<WallpaperImage> wallpaperImageListCars;

  List<WallpaperImage> wallpaperImageListArt;

  List<WallpaperImage> wallpaperImageListNature;

  List<WallpaperImage> wallpaperImageListGirls;

  List<WallpaperImage> wallpaperImageListCities;

  PicsLoadedState(this.tabController, this.wallpaperImageListPopular, this.wallpaperImageListArt, this.wallpaperImageListCars, this.wallpaperImageListNature, this.wallpaperImageListGirls, this.wallpaperImageListCities, BuildContext context
    );

}

class PicsErrorState extends PicsState {}
