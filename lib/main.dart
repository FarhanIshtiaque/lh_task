import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lh_task/core/routes/app_routes.dart';
import 'package:lh_task/modules/character/presentation/bloc/single_character/single_character_bloc.dart';
import 'package:lh_task/modules/character/presentation/bloc/single_character/single_character_event.dart';
import 'package:lh_task/modules/character/presentation/pages/all_cast.dart';
import 'package:lh_task/modules/character/presentation/pages/cast_details.dart';
import 'package:lh_task/modules/character/presentation/pages/characters_list.dart';
import 'package:lh_task/modules/home/presentation/pages/home.dart';

import 'injection_container.dart';
import 'modules/splash/splash.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
          title: 'Lemon Hive Task',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: router,
       //   home: const Home()
      ),
    );
  }
}
