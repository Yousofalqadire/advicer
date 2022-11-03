import 'package:advicer/application/core/services/theme_serivce,dart.dart';
import 'package:advicer/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application/screens/advicer/advicer_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context,themeService,child){
      return MaterialApp(
        title: 'Flutter Demo',
        theme:AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeService.isDarkModeOn? ThemeMode.dark:ThemeMode.light,
        home: const AdviserScreenWrapper(),
      );
    });

  }
}


