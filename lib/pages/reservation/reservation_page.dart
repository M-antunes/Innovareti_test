import 'package:flutter/material.dart';
import 'package:innovareti_test/models/room_model.dart';

import 'package:innovareti_test/shared/theme/app_colors.dart';
import 'package:innovareti_test/shared/theme/app_text_styles.dart';

import 'widgets/reservation_detail_card.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  bool isMettingSelected = false;
  bool isStationSelected = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var room = ModalRoute.of(context)!.settings.arguments as RoomModel;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 12,
        automaticallyImplyLeading: true,
        title: const Text("Conference Room"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: size.height * 0.02),
          Text(
            'Selecione o tipo de reserva\npara a ${room.name}:',
            textAlign: TextAlign.center,
            style: AppTextStyles.reservationTitle,
          ),
          SizedBox(height: size.height * 0.07),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isStationSelected = !isStationSelected;
                    isMettingSelected = false;
                  });
                },
                child: ReservationDetailCard(
                  size: size,
                  isStationSelected: isStationSelected,
                  text: 'Estação\nde Trabalho',
                  imageString: 'assets/images/work_station.jpg',
                  textDetail:
                      'Reserve a ${room.name} para\nseus trabalhos específicos',
                ),
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isMettingSelected = !isMettingSelected;
                    isStationSelected = false;
                  });
                },
                child: ReservationDetailCard(
                  size: size,
                  isStationSelected: isMettingSelected,
                  text: 'Reunião',
                  imageString: 'assets/images/meeting.jpg',
                  textDetail: 'Reserve a ${room.name} para\nsuas reuniões',
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.15,
          ),
          InkWell(
            onTap: isMettingSelected || isStationSelected
                ? () {
                    ConfirmReservationMessage(context, size);
                  }
                : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                height: size.height * 0.06,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isMettingSelected || isStationSelected
                        ? AppColors.primary!
                        : Colors.grey[600]!,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Reservar',
                    style: isMettingSelected || isStationSelected
                        ? AppTextStyles.roomReserveButton
                        : TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> ConfirmReservationMessage(BuildContext context, Size size) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: SizedBox(
          width: size.width * 0.4,
          height: size.height * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check,
                size: 60,
                color: AppColors.primary,
              ),
              Text(
                'Reservado!',
                style: AppTextStyles.roomReserveButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
