import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:maahi_lms/src/cores/cores.dart';
import 'package:maahi_lms/src/presentation/widgets/widgets.dart';
import 'package:maahi_lms/src/routes/routes_name.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({
    required this.child,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('AppNavBar'));

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: AppBottomBar(
        opacity: .2,
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int? index) => _onTap(context, index ?? 0),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(23)),
        elevation: 8,
        hasInk: true, //new, gives a cute ink effect
        items: _navigationItems,
      ),
    );
  }

  static const _navigationItems = <AppBottomBarItem>[
    AppBottomBarItem(
      icon: Icon(AppIcons.home),
      activeIcon: Icon(AppIcons.homeAlt),
      title: Text("Home"),
    ),
    AppBottomBarItem(
      icon: Icon(AppIcons.courses),
      activeIcon: Icon(AppIcons.coursesAlt),
      title: Text("Courses"),
    ),
    AppBottomBarItem(
      icon: Icon(AppIcons.live),
      activeIcon: Icon(AppIcons.liveAlt),
      title: Text("Live"),
    ),
    AppBottomBarItem(
      icon: Icon(AppIcons.profile),
      activeIcon: Icon(AppIcons.profileAlt),
      title: Text("Profile"),
    )
  ];

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    if (location.startsWith(RoutesName.home)) {
      return 0;
    }
    if (location.startsWith(RoutesName.courses)) {
      return 1;
    }
    if (location.startsWith(RoutesName.liveCourses)) {
      return 2;
    }
    if (location.startsWith(RoutesName.profile)) {
      return 3;
    }

    return 0;
  }

  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(RoutesName.home);
        break;
      case 1:
        GoRouter.of(context).go(RoutesName.courses);
        break;
      case 2:
        GoRouter.of(context).go(RoutesName.liveCourses);
        break;
      case 3:
        GoRouter.of(context).go(RoutesName.profile);
        break;
    }
  }
}
