
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:raaga/Pages/Screen_Splash.dart';
import 'package:raaga/dataBase/songModel.dart';

Box<songDataBaseModel>? SongDB;

Future<void> main() async {
  
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(songDataBaseModelAdapter().typeId)) {
    Hive.registerAdapter(songDataBaseModelAdapter());
  }


  await Hive.openBox<List>(boxname);
  final box = Raaga_SongData.getInstance();

  List<dynamic> favKeys = box.keys.toList();
 if (!favKeys.contains("favourites")) {
    List<dynamic> likedSongs = [];
    await box.put("favourites", likedSongs);
  }
  
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // Use this line to prevent extra rebuilds
          useInheritedMediaQuery: true,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme

          home: screen_splashScreen(),
        );
      },
    );
  }
}
