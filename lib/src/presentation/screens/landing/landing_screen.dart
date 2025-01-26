import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../cores/cores.dart';
import '../../../routes/routes_name.dart';
import '../../widgets/widgets.dart';

class LandingScreen extends StatelessWidget {
  final Widget child;

  const LandingScreen({
    key,
    required this.child,
  }) : super(key: key ?? const ValueKey<String>('LandingScreen'));

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return SafeArea(
      child: Scaffold(
        body: child,
        bottomNavigationBar: AppBottomBar(
          backgroundColor: colorScheme.surface,
          opacity: .2,
          currentIndex: _calculateSelectedIndex(context),
          onTap: (int? index) => _onTap(context, index ?? 0),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          elevation: 10,
          hasInk: true,
          //new, gives a cute ink effect
          items: _navigationItems,
        ),
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
