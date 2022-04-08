// Text(
// 'SMTH HERE',
// ),
// ElevatedButton(
// onPressed: () => { picSetter.setPicHome()}
// , child: const Text('Home')),
// ElevatedButton(
// onPressed: () => { picSetter.setPicLock()}
// , child: const Text('lock')),
// ElevatedButton(
// onPressed: () => { picSetter.setPicBoth()}
// , child: const Text('Both')),
//
// class picSetter extends _MyHomePageState {
//   static setPicHome() async {
//     String url = "https://sun9-81.userapi.com/impf/RUvaMuytmhW2U4jDvlHOFs52m3nxjUS-pagKcA/lM_NYoN3kf4.jpg?size=1080x1227&quality=96&sign=1bfe106cc90468a9c8392bcd930bd45e&type=album";
//     int location = WallpaperManager.HOME_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
//     String result;
//     var file = await DefaultCacheManager().getSingleFile(url);
//     final String success = await WallpaperManager.setWallpaperFromFile(file.path, location);
//   }
//   static setPicLock() async {
//     String url = "https://sun9-81.userapi.com/impf/RUvaMuytmhW2U4jDvlHOFs52m3nxjUS-pagKcA/lM_NYoN3kf4.jpg?size=1080x1227&quality=96&sign=1bfe106cc90468a9c8392bcd930bd45e&type=album";
//     int location = WallpaperManager.LOCK_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
//     String result;
//     var file = await DefaultCacheManager().getSingleFile(url);
//     final String success = await WallpaperManager.setWallpaperFromFile(file.path, location);
//   }
//   static setPicBoth() async {
//     String url = "https://sun9-81.userapi.com/impf/RUvaMuytmhW2U4jDvlHOFs52m3nxjUS-pagKcA/lM_NYoN3kf4.jpg?size=1080x1227&quality=96&sign=1bfe106cc90468a9c8392bcd930bd45e&type=album";
//     int location = WallpaperManager.BOTH_SCREENS; // or location = WallpaperManager.LOCK_SCREEN;
//     String result;
//     var file = await DefaultCacheManager().getSingleFile(url);
//     final String success = await WallpaperManager.setWallpaperFromFile(file.path, location);
//   }
// }
