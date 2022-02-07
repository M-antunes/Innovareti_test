import 'package:flutter/material.dart';

import 'package:innovareti_test/models/mocked_room_model.dart';
import 'package:innovareti_test/pages/home/widgets/room_card.dart';
import 'package:innovareti_test/shared/theme/app_colors.dart';
import 'package:innovareti_test/shared/theme/app_text_styles.dart';

import 'widgets/capacity_filter.dart';
import '../../shared/widgets/horizontal_divider.dart';
import 'widgets/qualification_filter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecked = false;
  final MockedRoomModel mockedRoomModel = MockedRoomModel();

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
              child: Card(
                elevation: 10,
                child: Container(
                  height: size.height * 0.08,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                      child: Text(
                        'Encontre aqui sua sala de reunião',
                        style: AppTextStyles.roomFeatures,
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (_) {
                  return StatefulBuilder(builder: (context, setState) {
                    return SizedBox(
                      height: size.height * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            child: Center(
                              child: Container(
                                width: size.width * 0.4,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey[600],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: const Text(
                                'Filtrar',
                                style: AppTextStyles.filterBy,
                              ),
                            ),
                          ),
                          const HorizontalDivider(),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            child: const Text(
                              'Qualificações',
                              style: AppTextStyles.filterOption,
                            ),
                          ),
                          const HorizontalDivider(),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          QualificationFilter(
                              size: size, mockedRoomModel: mockedRoomModel),
                          const HorizontalDivider(),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            child: Text(
                              'Capacidade da Sala',
                              style: AppTextStyles.filterOption,
                            ),
                          ),
                          const HorizontalDivider(),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          CapacityFilter(
                              size: size, mockedRoomModel: mockedRoomModel)
                        ],
                      ),
                    );
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  var room = mockedRoomModel.listOfModels[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/reservation',
                          arguments: room);
                    },
                    child: RoomCard(
                      size: size,
                      room: room,
                    ),
                  );
                },
                itemCount: mockedRoomModel.listOfModels.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
