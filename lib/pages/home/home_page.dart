import 'package:flutter/material.dart';
import 'package:innovareti_test/controller/reservation_controller.dart';

import 'package:innovareti_test/models/mocked_room_model.dart';
import 'package:innovareti_test/pages/home/widgets/room_card.dart';
import 'package:innovareti_test/shared/theme/app_colors.dart';
import 'package:innovareti_test/shared/theme/app_text_styles.dart';
import 'package:provider/provider.dart';

import 'widgets/filter_bottom_sheet.dart';
import 'widgets/filter_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecked = false;
  final MockedRoomModel mockedRoomModel = MockedRoomModel();
  late final ReservationController _reservationController;

  @override
  void initState() {
    _reservationController = context.read<ReservationController>();
    _reservationController.getRooms();
    super.initState();
  }

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
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              child: FilterButton(size: size),
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (_) {
                  return StatefulBuilder(builder: (context, setState) {
                    return FilterBottomSheet(
                      controller: _reservationController,
                      size: size,
                    );
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Consumer<ReservationController>(
                  builder: (context, state, child) {
                if (_reservationController.filteredRooms.isEmpty) {
                  return Center(
                    child: SizedBox(
                      width: size.width * 0.8,
                      child: const FittedBox(
                        fit: BoxFit.fill,
                        child: Text(
                          'Nenhuma sala se enquadra nos\nparâmetros estabelecidos',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.noRoomText,
                        ),
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: _reservationController.filteredRooms.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/reservation',
                            arguments:
                                _reservationController.filteredRooms[index]);
                      },
                      child: RoomCard(
                        size: size,
                        room: _reservationController.filteredRooms[index],
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
