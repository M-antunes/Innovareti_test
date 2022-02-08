import 'package:flutter/material.dart';
import 'package:innovareti_test/models/room_model.dart';
import 'package:innovareti_test/shared/theme/app_colors.dart';

class CheckInButon extends StatelessWidget {
  const CheckInButon({
    Key? key,
    required this.room,
  }) : super(key: key);

  final RoomModel room;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: !room.hasCheckedIn,
          child: Center(
            child: Text(
              'Check-in\nAqui',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: room.hasCheckedIn ? Colors.white : AppColors.primary),
            ),
          ),
        ),
        Visibility(
          visible: room.hasCheckedIn,
          child: const Center(
            child: Icon(
              Icons.check,
              size: 40,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
