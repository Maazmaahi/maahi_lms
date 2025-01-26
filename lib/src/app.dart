import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maahi_lms/src/cores/cores.dart';
import 'package:maahi_lms/src/routes/app_router.dart';
import 'package:provider/provider.dart';

import 'providers/providers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const bgColor = AppColors.lightPrimaryColor;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: bgColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: bgColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: bgColor,
    ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider()..init(),
        ),
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Maahi LMS',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          routerConfig: AppRouter.router,
        );
      }),
    );
  }
}
