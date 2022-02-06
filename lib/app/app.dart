import 'package:flutter/material.dart';
import 'package:innovareti_test/pages/home/home_page.dart';
import 'package:innovareti_test/shared/core/route_generator.dart';
import 'package:innovareti_test/shared/theme/app_colors.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      navigatorKey: _navigatorKey,
      home: const HomePage(),
    );
  }
}
