import 'package:flutter/cupertino.dart';

class AppTextStyles {
  static const roomName = TextStyle(
    fontSize: 20,
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.bold,
  );
  static const roomAddress = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static const roomCapacity = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(0, 0, 0, 0),
  );
  static const roomFeatures = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const reservationTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const filterBy = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const filterOption = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}
