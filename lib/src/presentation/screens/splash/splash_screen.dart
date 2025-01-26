import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maahi_lms/src/cores/cores.dart';
import 'package:maahi_lms/src/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    final isLoggedIn = LocalStorage.getBool(LocalStorage.isLoggedIn);
    Future.delayed(const Duration(seconds: 2), () {
      if (isLoggedIn) {
        context.go(RoutesName.home);
      } else {
        context.go(RoutesName.intro);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: const Center(
        child: Text("Course"),
      ),
    );
  }
}
