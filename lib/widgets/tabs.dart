import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wpmgr/classes/circleTabIndicator.dart';
import 'package:wpmgr/widgets/wallpaper.dart';

Widget tabs(_tabController, wallpaperImageListPopular, wallpaperImageListArt, wallpaperImageListCars, wallpaperImageListNature, wallpaperImageListGirls, wallpaperImageListCities, context) {
  return SizedBox(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              labelStyle: TextStyle(
                height: 0,
                  fontWeight: FontWeight.w700,
                  fontSize: 60),
              isScrollable: true,
              labelPadding: const EdgeInsets.only(left: 10, right: 50, top: 50, bottom: 10),
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white24,
              indicatorPadding: EdgeInsets.only(left: -30),
              unselectedLabelStyle: TextStyle(fontSize: 50,  fontWeight: FontWeight.w700,),
              indicator: CircleTabIndicator(color: Colors.white, radius: 7),
              tabs: const [
                Tab(
                  text: "Popular",
                ),
                Tab(
                  text: "Art",
                ),
                Tab(
                  text: "Cars",
                ),
                Tab(
                  text: "Nature",
                ),
                Tab(
                  text: "Girls",
                ),
                Tab(
                  text: "Cities",
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height *6.1,
            child: TabBarView(
              controller: _tabController,
              children: [
                wallpapersList(wallpaperImageList: wallpaperImageListPopular, context: context),
                wallpapersList(wallpaperImageList: wallpaperImageListArt, context: context),
                wallpapersList(wallpaperImageList: wallpaperImageListCars, context: context),
                wallpapersList(wallpaperImageList: wallpaperImageListNature, context: context),
                wallpapersList(wallpaperImageList: wallpaperImageListGirls, context: context),
                wallpapersList(wallpaperImageList: wallpaperImageListCities, context: context)
              ],
            ),
          )
        ],
      ));
}
