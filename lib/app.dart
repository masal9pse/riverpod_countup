import 'package:flutter/material.dart';
import 'importer.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.mainColor),
        scaffoldBackgroundColor: AppColors.baseColor,
      ),
      home: const HomePage(),
    );
  }
}