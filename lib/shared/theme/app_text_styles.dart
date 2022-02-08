import 'package:flutter/cupertino.dart';
import 'package:innovareti_test/shared/theme/app_colors.dart';

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
    color: AppColors.white,
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
  static final roomReserveBoxText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
  static final roomReserveBoxDetails = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );
  static final roomReserveButton = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );
  static const noRoomText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );
}
