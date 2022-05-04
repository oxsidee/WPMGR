import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wpmgr/bloc/pics_bloc.dart';
import 'package:wpmgr/bloc/pics_state.dart';
import 'package:wpmgr/classes/circle_tabIndicator.dart';
import 'package:wpmgr/widgets/wallpaper.dart';

class Tabs extends StatelessWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PicsBloc, PicsState>(builder: (context, state) {
      if (state is PicsLoadedState) {
        return NestedScrollView(
          controller: state.scrollController,
          headerSliverBuilder: (context, value) {
            return [
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.only(top: 100),
                  child: TabBar(
                    labelStyle: const TextStyle(
                        height: 0, fontWeight: FontWeight.w700, fontSize: 60),
                    isScrollable: true,
                    labelPadding: const EdgeInsets.only(
                        left: 10, right: 50, top: 50, bottom: 10),
                    controller: state.tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white24,
                    indicatorPadding: const EdgeInsets.only(left: -30),
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                    ),
                    indicator:
                        const CircleTabIndicator(color: Colors.white, radius: 7),
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
              ),
            ];
          },
          body: Container(
            child: TabBarView(
              controller: state.tabController,
              children: [
                wallpapersList(
                    wallpaperImageList: state.wallpaperImageListPopular,
                    context: context),
                wallpapersList(
                    wallpaperImageList: state.wallpaperImageListArt,
                    context: context),
                wallpapersList(
                    wallpaperImageList: state.wallpaperImageListCars,
                    context: context),
                wallpapersList(
                    wallpaperImageList: state.wallpaperImageListNature,
                    context: context),
                wallpapersList(
                    wallpaperImageList: state.wallpaperImageListGirls,
                    context: context),
                wallpapersList(
                    wallpaperImageList: state.wallpaperImageListCities,
                    context: context)
              ],
            ),
          ),
        );

        //
        //
        // SizedBox(
        //   child: Column(
        //     children: [
        //       Align(
        //         alignment: Alignment.centerLeft,
        //         child: TabBar(
        //           labelStyle:
        //           const TextStyle(
        //               height: 0, fontWeight: FontWeight.w700, fontSize: 60),
        //           isScrollable: true,
        //           labelPadding:
        //           const EdgeInsets.only(left: 10, right: 50, top: 50, bottom: 10),
        //           controller: state.tabController,
        //           labelColor: Colors.white,
        //           unselectedLabelColor: Colors.white24,
        //           indicatorPadding: const EdgeInsets.only(left: -30),
        //           unselectedLabelStyle: const TextStyle(
        //             fontSize: 50,
        //             fontWeight: FontWeight.w700,
        //           ),
        //           indicator: const CircleTabIndicator(color: Colors.white, radius: 7),
        //           tabs: const [
        //             Tab(
        //               text: "Popular",
        //             ),
        //             Tab(
        //               text: "Art",
        //             ),
        //             Tab(
        //               text: "Cars",
        //             ),
        //             Tab(
        //               text: "Nature",
        //             ),
        //             Tab(
        //               text: "Girls",
        //             ),
        //             Tab(
        //               text: "Cities",
        //             )
        //           ],
        //         ),
        //       ),
        //       SizedBox(
        //         child: TabBarView(
        //           controller: state.tabController,
        //           children: [
        //             wallpapersList(
        //                 wallpaperImageList: state.wallpaperImageListPopular,
        //                 context: context),
        //             wallpapersList(
        //                 wallpaperImageList: state.wallpaperImageListArt,
        //                 context: context),
        //             wallpapersList(
        //                 wallpaperImageList: state.wallpaperImageListCars,
        //                 context: context),
        //             wallpapersList(
        //                 wallpaperImageList: state.wallpaperImageListNature,
        //                 context: context),
        //             wallpapersList(
        //                 wallpaperImageList: state.wallpaperImageListGirls,
        //                 context: context),
        //             wallpapersList(
        //                 wallpaperImageList: state.wallpaperImageListCities,
        //                 context: context)
        //           ],
        //         ),
        //       )
        //     ],
        //   ));
      }

      if (state is PicsEmptyState) {
        return const Center(
          child: Text('No data :(', style: TextStyle(color: Colors.white)),
        );
      }

      if (state is PicsLoadingState) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      }

      if (state is PicsErrorState) {
        return const Center(
          child: Text(
            'Error. Try later...',
            style: TextStyle(color: Colors.white),
          ),
        );
      }
      return const SizedBox();
    });
  }
}
