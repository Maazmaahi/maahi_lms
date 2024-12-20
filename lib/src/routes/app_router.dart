import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:maahi_lms/src/routes/routes_name.dart';

import 'app_nav_bar.dart';
import 'app_routes.dart';

class AppRouter {
  static GoRouter get router => _router;
  static GlobalKey<NavigatorState> get rootNavigatorKey => _rootNavigatorKey;
  static GlobalKey<NavigatorState> get mainMenuNavigatorKey => _mainMenuNavigatorKey;

  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> _mainMenuNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'main-menu');

  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutesName.home,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _mainMenuNavigatorKey,
        builder: (_, __, child) {
          return AppNavBar(child: child);
        },
        routes: <RouteBase>[
          ...AppRoutes.mainMenuRoutes,
        ],
      ),
    ],
  );
}
