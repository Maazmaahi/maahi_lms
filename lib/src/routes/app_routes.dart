import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:maahi_lms/src/presentation/screens/screens.dart';
import 'package:maahi_lms/src/routes/app_router.dart';
import 'package:maahi_lms/src/routes/routes_name.dart';

class AppRoutes {
  static final routes = <RouteBase>[
    GoRoute(
      name: RoutesName.forgetPassword,
      path: RoutesName.forgetPassword,
      builder: (_, __) => const ForgetPasswordScreen(),
    ),
    GoRoute(
      name: RoutesName.intro,
      path: RoutesName.intro,
      builder: (_, __) => const IntroScreen(),
      redirect: AppRouter.loginRedirect,
    ),
    GoRoute(
      name: RoutesName.login,
      path: RoutesName.login,
      builder: (_, __) => const LoginScreen(),
    ),
    GoRoute(
      name: RoutesName.onboarding,
      path: RoutesName.onboarding,
      builder: (_, __) => const OnboardingScreen(),
    ),
    GoRoute(
      name: RoutesName.otp,
      path: RoutesName.otp,
      builder: (_, __) => const OtpScreen(),
    ),
    GoRoute(
      name: RoutesName.register,
      path: RoutesName.register,
      builder: (_, __) => const RegisterScreen(),
    ),
    GoRoute(
      name: RoutesName.splash,
      path: RoutesName.splash,
      builder: (_, __) => const SplashScreen(),
    ),
  ].toList(growable: false);

  static final mainMenuRoutes = <RouteBase>[
    GoRoute(
      name: RoutesName.home,
      path: RoutesName.home,
      pageBuilder: (_, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          transitionDuration: kThemeAnimationDuration,
          reverseTransitionDuration: kThemeAnimationDuration,
          child: const HomeScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      name: RoutesName.courses,
      path: RoutesName.courses,
      pageBuilder: (_, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          transitionDuration: kThemeAnimationDuration,
          reverseTransitionDuration: kThemeAnimationDuration,
          child: const CoursesScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      name: RoutesName.liveCourses,
      path: RoutesName.liveCourses,
      pageBuilder: (_, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          transitionDuration: kThemeAnimationDuration,
          reverseTransitionDuration: kThemeAnimationDuration,
          child: const LiveCoursesScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
    GoRoute(
      name: RoutesName.profile,
      path: RoutesName.profile,
      pageBuilder: (_, state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          transitionDuration: kThemeAnimationDuration,
          reverseTransitionDuration: kThemeAnimationDuration,
          child: const ProfileScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
  ].toList(growable: false);
}
