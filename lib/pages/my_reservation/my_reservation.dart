import 'package:flutter/material.dart';
import 'package:innovareti_test/controller/reservation_controller.dart';
import 'package:innovareti_test/shared/theme/app_colors.dart';
import 'package:innovareti_test/shared/theme/app_text_styles.dart';
import 'package:innovareti_test/shared/widgets/horizontal_divider.dart';
import 'package:provider/provider.dart';

import 'widgets/check_in_button.dart';

class MyReservations extends StatefulWidget {
  const MyReservations({Key? key}) : super(key: key);

  @override
  State<MyReservations> createState() => _MyReservationsState();
}

class _MyReservationsState extends State<MyReservations> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 12,
        title: const Text("Conference Room"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: 30,
                ),
                SizedBox(width: size.width * 0.05),
                Text(
                  'Perfil',
                  style: AppTextStyles.roomReserveButton,
                ),
              ],
            ),
          ),
          const HorizontalDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Minhas Reservas',
              style: AppTextStyles.roomReserveButton,
            ),
          ),
          const HorizontalDivider(),
          Expanded(
            child: Consumer<ReservationController>(
              builder: (context, controller, child) {
                if (controller.roomsReserved.isEmpty) {
                  return const Center(
                    child: Text(
                      'Você ainda não tem\nsalas reservadas.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.noRoomText,
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: controller.roomsReserved.length,
                  itemBuilder: (context, index) {
                    var room = controller.roomsReserved[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      child: ListTile(
                        leading: SizedBox(
                          width: size.width * 0.25,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(room.imageUrl),
                          ),
                        ),
                        title: Text(room.name),
                        subtitle: Text('Reserva para\n${room.type}'),
                        trailing: SizedBox(
                          width: size.width * 0.2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: room.hasCheckedIn
                                  ? AppColors.primary
                                  : Colors.transparent,
                              border: Border.all(
                                color: AppColors.primary!,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  room.hasCheckedIn = !room.hasCheckedIn;
                                  showScaffoldMessage(room.hasCheckedIn);
                                });
                              },
                              child: CheckInButon(room: room),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  showScaffoldMessage(bool checkIn) {
    if (checkIn) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(
          seconds: 1,
        ),
        backgroundColor: AppColors.primary,
        content: const Text(
          'Check-in realizado.',
          style: AppTextStyles.roomCapacity,
        ),
      ));
      return;
    }
    if (!checkIn) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(
          seconds: 1,
        ),
        backgroundColor: Colors.grey[500],
        content: Text(
          'Check-in Cancelado.',
          style: AppTextStyles.roomReserveButton,
        ),
      ));
      return;
    }
  }
}
