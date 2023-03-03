import 'package:auto_route/auto_route.dart';
import 'package:flutter_starter/auth/index.dart';
import 'package:flutter_starter/home.dart';
import 'package:flutter_starter/splash.dart';
import 'package:flutter_starter/profile/index.dart';
import 'package:flutter_starter/shipment/index.dart';
import 'package:flutter_starter/store/index.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: <AutoRoute>[
      AutoRoute(
          page: SplashPage,
          initial: true,
          name: 'splash',
          guards: [AuthGuard]
      ),
      CustomRoute(
          durationInMilliseconds: 1000,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          path: '/login',
          page: LoginPage,
          name: 'login',
          guards: [AuthGuard]
      ),
      CustomRoute(
          durationInMilliseconds: 1000,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          path: '/home',
          page: HomePage,
          name: 'home',
          children: [
            CustomRoute(
              durationInMilliseconds: 500,
              transitionsBuilder: TransitionsBuilders.zoomIn,
              page: ProfilePage,
              path: 'profile'
            ),
            CustomRoute(
              durationInMilliseconds: 500,
              transitionsBuilder: TransitionsBuilders.zoomIn,
              page: ShipmentPage,
              path: 'shipment'
            ),
            CustomRoute(
              durationInMilliseconds: 500,
              transitionsBuilder: TransitionsBuilders.zoomIn,
              page: StoresPage,
              path: 'store'
            ),
          ]
      ),
    ]
)
class $AppRouter {}