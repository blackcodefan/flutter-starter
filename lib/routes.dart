import 'package:auto_route/auto_route.dart';
import 'package:flutter_starter/auth/index.dart';
import 'package:flutter_starter/home.dart';
import 'package:flutter_starter/splash.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: <AutoRoute>[
      AutoRoute(page: SplashPage, initial: true),
      CustomRoute(
          durationInMilliseconds: 1000,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          path: '/login', page: LoginPage
      ),
      CustomRoute(
          durationInMilliseconds: 1000,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          path: '/home', page: HomePage
      ),
    ]
)
class $AppRouter {}