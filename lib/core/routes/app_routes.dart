import 'package:go_router/go_router.dart';
import 'package:lh_task/modules/character/presentation/pages/all_cast.dart';
import 'package:lh_task/modules/character/presentation/pages/cast_details.dart';
import 'package:lh_task/modules/home/presentation/pages/home.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Home(),
    ),

    // GoRoute(
    //   path: '/cast-details',
    //   builder: (context, state) => CastDetails(),
    // ),
  ],
);