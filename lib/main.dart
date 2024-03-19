import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lh_task/modules/character/presentation/bloc/single_character/single_character_bloc.dart';
import 'package:lh_task/modules/character/presentation/bloc/single_character/single_character_event.dart';

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
    return MaterialApp(
        title: 'Lemon Hive Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  getIt<SingleCharacterBloc>(),
            ),
          ],
          child: const Splash(),
        ));
  }
}
