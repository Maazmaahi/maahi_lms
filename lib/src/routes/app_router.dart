import 'dart:async';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../presentation/screens/landing/landing_screen.dart';
import 'app_nav_bar.dart';
import 'app_routes.dart';
import 'routes_name.dart';

class AppRouter {
  static GoRouter get router => _router;

  static GlobalKey<NavigatorState> get rootNavigatorKey => _rootNavigatorKey;

  static GlobalKey<NavigatorState> get mainMenuNavigatorKey =>
      _mainMenuNavigatorKey;

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> _mainMenuNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'main-menu');

  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutesName.splash,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      ...AppRoutes.routes,
      ShellRoute(
        navigatorKey: _mainMenuNavigatorKey,
        builder: (_, __, child) {
          return LandingScreen(child: child);
        },
        routes: <RouteBase>[
          ...AppRoutes.mainMenuRoutes,
        ],
      ),
    ],
  );

  static FutureOr<String?> loginRedirect(_, state) async {
    return null;

    // final db = StorageDB();
    // final token = await db.getToken();
    //
    // // Note: if the user is not logged in, they need to login
    // final bool loggedIn = token != null;
    // if(!loggedIn) {
    //   return RoutesName.login;
    // }
    //
    // final bool loggingIn = state.matchedLocation == RoutesName.login;
    //
    // // Note: If the user is logged in but still on the login page, send them to the home page
    // if(loggingIn) {
    //   return RoutesName.home;
    // }
    //
    // // Note: No need to redirect at all
    // return null;
  }
}
