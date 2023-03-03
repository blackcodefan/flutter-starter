import 'home.dart';
import 'splash.dart';
import 'auth_app/index.dart';
import 'store_app/index.dart';
import 'profile_app/index.dart';
import 'shipment_app/index.dart';
import 'package:auto_route/auto_route.dart';

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