// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import 'auth/index.dart' as _i2;
import 'home.dart' as _i3;
import 'profile/index.dart' as _i4;
import 'shipment/index.dart' as _i5;
import 'splash.dart' as _i1;
import 'store/index.dart' as _i6;

class AppRouter extends _i7.RootStackRouter {
  AppRouter(
      {_i8.GlobalKey<_i8.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i2.AuthGuard authGuard;

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    Splash.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    Login.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.LoginPage(),
          transitionsBuilder: _i7.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1000,
          opaque: true,
          barrierDismissible: false);
    },
    Home.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.HomePage(),
          transitionsBuilder: _i7.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1000,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.ProfilePage(),
          transitionsBuilder: _i7.TransitionsBuilders.zoomIn,
          durationInMilliseconds: 500,
          opaque: true,
          barrierDismissible: false);
    },
    ShipmentRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i5.ShipmentPage(),
          transitionsBuilder: _i7.TransitionsBuilders.zoomIn,
          durationInMilliseconds: 500,
          opaque: true,
          barrierDismissible: false);
    },
    StoresRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.StoresPage(),
          transitionsBuilder: _i7.TransitionsBuilders.zoomIn,
          durationInMilliseconds: 500,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(Splash.name, path: '/', guards: [authGuard]),
        _i7.RouteConfig(Login.name, path: '/login', guards: [authGuard]),
        _i7.RouteConfig(Home.name, path: '/home', children: [
          _i7.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: Home.name),
          _i7.RouteConfig(ShipmentRoute.name,
              path: 'shipment', parent: Home.name),
          _i7.RouteConfig(StoresRoute.name, path: 'store', parent: Home.name)
        ])
      ];
}

/// generated route for
/// [_i1.SplashPage]
class Splash extends _i7.PageRouteInfo<void> {
  const Splash() : super(Splash.name, path: '/');

  static const String name = 'Splash';
}

/// generated route for
/// [_i2.LoginPage]
class Login extends _i7.PageRouteInfo<void> {
  const Login() : super(Login.name, path: '/login');

  static const String name = 'Login';
}

/// generated route for
/// [_i3.HomePage]
class Home extends _i7.PageRouteInfo<void> {
  const Home({List<_i7.PageRouteInfo>? children})
      : super(Home.name, path: '/home', initialChildren: children);

  static const String name = 'Home';
}

/// generated route for
/// [_i4.ProfilePage]
class ProfileRoute extends _i7.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i5.ShipmentPage]
class ShipmentRoute extends _i7.PageRouteInfo<void> {
  const ShipmentRoute() : super(ShipmentRoute.name, path: 'shipment');

  static const String name = 'ShipmentRoute';
}

/// generated route for
/// [_i6.StoresPage]
class StoresRoute extends _i7.PageRouteInfo<void> {
  const StoresRoute() : super(StoresRoute.name, path: 'store');

  static const String name = 'StoresRoute';
}
