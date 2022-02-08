import 'package:flutter/material.dart';
import 'package:innovareti_test/controller/reservation_controller.dart';

import 'package:innovareti_test/models/room_model.dart';
import 'package:innovareti_test/shared/theme/app_colors.dart';
import 'package:innovareti_test/shared/theme/app_text_styles.dart';
import 'package:innovareti_test/shared/widgets/app_button.dart';
import 'package:provider/provider.dart';

import 'widgets/reservation_detail_card.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  bool isMettingSelected = false;
  bool isStationSelected = false;
  late final ReservationController _reservationController;

  @override
  void initState() {
    _reservationController = context.read<ReservationController>();
    super.initState();
  }

  selectTypeOfReservation(RoomModel room, Size size) {
    if (isMettingSelected) {
      room.type = "Reunião";
      reserveRoom(room, size, room.type!);
    } else if (isStationSelected) {
      room.type = "Estação de Trabalho";
      reserveRoom(room, size, room.type!);
    } else {
      return null;
    }
  }

  reserveRoom(RoomModel room, Size size, String type) {
    if (_reservationController.chekIfRoomIsAlreadyReserved(room)) {
      confirmReservationMessage(context, size, Icons.cancel_outlined,
          'Você já Reservou a\n${room.name}');
      return;
    }
    _reservationController.fillReservedRooms(room);
    // _reservationController.chooseReservationType(type);
    confirmReservationMessage(context, size, Icons.check, 'Reservada!');
  }

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
          SizedBox(height: size.height * 0.01),
          SizedBox(
            height: size.height * 0.15,
            child: Image.asset(room.imageUrl),
          ),
          SizedBox(height: size.height * 0.03),
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
                  isSelected: isStationSelected,
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
                  isSelected: isMettingSelected,
                  text: 'Reunião',
                  imageString: 'assets/images/meeting.jpg',
                  textDetail: 'Reserve a ${room.name} para\nsuas reuniões',
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          InkWell(
            splashColor: isMettingSelected || isStationSelected
                ? Colors.purple
                : Colors.transparent,
            onTap: () => selectTypeOfReservation(room, size),
            child: AppButton(
                text: 'Reservar',
                size: size,
                boolean1: isMettingSelected,
                boolean2: isStationSelected),
          ),
        ],
      ),
    );
  }

  Future<dynamic> confirmReservationMessage(
      BuildContext context, Size size, IconData icon, String text) {
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
                (icon),
                size: 60,
                color: AppColors.primary,
              ),
              Text(
                text,
                style: AppTextStyles.roomReserveButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
