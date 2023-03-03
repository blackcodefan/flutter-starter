import 'package:auto_route/auto_route.dart';
import 'package:flutter_starter/auth_app/index.dart';
import 'package:flutter_starter/home.dart';
import 'package:flutter_starter/splash.dart';
import 'package:flutter_starter/profile_app/index.dart';
import 'package:flutter_starter/shipment_app/index.dart';
import 'package:flutter_starter/store_app/index.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: <AutoRoute>[
      AutoRoute(
          page: SplashPage,
          initial: true,
          name: 'splash'
      ),
      CustomRoute(
          durationInMilliseconds: 1000,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          path: '/login',
          page: LoginPage,
          name: 'login',
      ),
      CustomRoute(
          durationInMilliseconds: 1000,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          path: '/home',
          page: HomePage,
          name: 'home',
          guards: [AuthGuard],
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