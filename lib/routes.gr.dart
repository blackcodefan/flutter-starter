// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import 'auth_app/index.dart' as _i2;
import 'auth_app/screens/register.dart' as _i3;
import 'home.dart' as _i4;
import 'profile_app/index.dart' as _i5;
import 'shipment_app/index.dart' as _i6;
import 'splash.dart' as _i1;
import 'store_app/index.dart' as _i7;

class AppRouter extends _i8.RootStackRouter {
  AppRouter(
      {_i9.GlobalKey<_i9.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i2.AuthGuard authGuard;

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    Splash.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    Login.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.LoginPage(),
          transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 500,
          opaque: true,
          barrierDismissible: false);
    },
    Register.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.RegisterPage(),
          transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 500,
          opaque: true,
          barrierDismissible: false);
    },
    Home.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.HomePage(),
          transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1000,
          opaque: true,
          barrierDismissible: false);
    },
    ProfileRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i5.ProfilePage(),
          transitionsBuilder: _i8.TransitionsBuilders.zoomIn,
          durationInMilliseconds: 500,
          opaque: true,
          barrierDismissible: false);
    },
    ShipmentRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.ShipmentPage(),
          transitionsBuilder: _i8.TransitionsBuilders.zoomIn,
          durationInMilliseconds: 500,
          opaque: true,
          barrierDismissible: false);
    },
    StoresRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.StoresPage(),
          transitionsBuilder: _i8.TransitionsBuilders.zoomIn,
          durationInMilliseconds: 500,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(Splash.name, path: '/'),
        _i8.RouteConfig(Login.name, path: '/login'),
        _i8.RouteConfig(Register.name, path: '/register'),
        _i8.RouteConfig(Home.name, path: '/home', guards: [
          authGuard
        ], children: [
          _i8.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: Home.name),
          _i8.RouteConfig(ShipmentRoute.name,
              path: 'shipment', parent: Home.name),
          _i8.RouteConfig(StoresRoute.name, path: 'store', parent: Home.name)
        ])
      ];
}

/// generated route for
/// [_i1.SplashPage]
class Splash extends _i8.PageRouteInfo<void> {
  const Splash() : super(Splash.name, path: '/');

  static const String name = 'Splash';
}

/// generated route for
/// [_i2.LoginPage]
class Login extends _i8.PageRouteInfo<void> {
  const Login() : super(Login.name, path: '/login');

  static const String name = 'Login';
}

/// generated route for
/// [_i3.RegisterPage]
class Register extends _i8.PageRouteInfo<void> {
  const Register() : super(Register.name, path: '/register');

  static const String name = 'Register';
}

/// generated route for
/// [_i4.HomePage]
class Home extends _i8.PageRouteInfo<void> {
  const Home({List<_i8.PageRouteInfo>? children})
      : super(Home.name, path: '/home', initialChildren: children);

  static const String name = 'Home';
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i6.ShipmentPage]
class ShipmentRoute extends _i8.PageRouteInfo<void> {
  const ShipmentRoute() : super(ShipmentRoute.name, path: 'shipment');

  static const String name = 'ShipmentRoute';
}

/// generated route for
/// [_i7.StoresPage]
class StoresRoute extends _i8.PageRouteInfo<void> {
  const StoresRoute() : super(StoresRoute.name, path: 'store');

  static const String name = 'StoresRoute';
}
