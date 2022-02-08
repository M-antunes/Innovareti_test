import 'package:flutter/material.dart';
import 'package:innovareti_test/controller/reservation_controller.dart';
import 'package:innovareti_test/main_screen/main_screen.dart';
import 'package:innovareti_test/shared/core/route_generator.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ReservationController(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.onGenerateRoute,
        navigatorKey: _navigatorKey,
        home: const MainScreen(),
      ),
    );
  }
}
