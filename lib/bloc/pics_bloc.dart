import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wpmgr/bloc/pics_event.dart';
import 'package:wpmgr/bloc/pics_state.dart';
import 'package:wpmgr/classes/pics_updater.dart';
import 'package:wpmgr/classes/wallpaper_image.dart';

class PicsBloc extends Bloc<PicsEvent, PicsState> {
  TabController tabController;
  PicsBloc({required this.tabController, required context}) : super(PicsEmptyState()){
    on<PicsUpdate>((event, emit) async{
      emit(PicsLoadingState());
      try{
        int countPerPage = 72;

        List<WallpaperImage> wallpaperImageListPopular = await PicsUpdater.getWPPics('https://api.pexels.com/v1/curated?per_page=$countPerPage&page=1');

        List<WallpaperImage> wallpaperImageListCars = await PicsUpdater.getWPPics('https://api.pexels.com/v1/search?query=cars&per_page=$countPerPage&page=1');

        List<WallpaperImage> wallpaperImageListArt = await PicsUpdater.getWPPics('https://api.pexels.com/v1/search?query=art&per_page=$countPerPage&page=1');

        List<WallpaperImage> wallpaperImageListNature = await PicsUpdater.getWPPics('https://api.pexels.com/v1/search?query=nature&per_page=$countPerPage&page=1');

        List<WallpaperImage> wallpaperImageListGirls = await PicsUpdater.getWPPics('https://api.pexels.com/v1/search?query=girls&per_page=$countPerPage&page=1',);

        List<WallpaperImage> wallpaperImageListCities = await PicsUpdater.getWPPics('https://api.pexels.com/v1/search?query=cities&per_page=$countPerPage&page=1');
        
        emit(PicsLoadedState(tabController, wallpaperImageListPopular, wallpaperImageListArt, wallpaperImageListCars, wallpaperImageListNature, wallpaperImageListGirls, wallpaperImageListCities, context));
      }catch (_){
        emit(PicsErrorState());
      }
});
  }

  }