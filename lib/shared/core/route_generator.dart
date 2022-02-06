import 'package:flutter/material.dart';
import 'package:innovareti_test/pages/home/home_page.dart';
import 'package:innovareti_test/pages/reservation/reservation_page.dart';

import '../route/app_routes.dart';

abstract class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: routeSettings,
        );
      case AppRoutes.reservationPage:
        return MaterialPageRoute(
          builder: (_) => const ReservationPage(),
          settings: routeSettings,
        );
      default:
        throw Exception();
    }
  }
}
