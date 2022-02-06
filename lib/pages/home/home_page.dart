import 'package:flutter/material.dart';

import 'package:innovareti_test/models/mocked_room_model.dart';
import 'package:innovareti_test/pages/home/widgets/room_card.dart';
import 'package:innovareti_test/shared/theme/app_colors.dart';
import 'package:innovareti_test/shared/theme/app_text_styles.dart';

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
      drawer: const SizedBox(),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 12,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.notifications_none),
          ),
        ],
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
                        Text('Filtrar por:'),
                        Text('Qualificações'),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: SizedBox(
                            height: size.height * 0.4,
                            width: double.infinity,
                            child: GridView.builder(
                              itemCount:
                                  mockedRoomModel.listOfFeaturesToCheck.length,
                              itemBuilder: (context, index) {
                                var feature = mockedRoomModel
                                    .listOfFeaturesToCheck[index];

                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              mockedRoomModel
                                                      .listOfBools[index] =
                                                  !mockedRoomModel
                                                      .listOfBools[index];
                                            });
                                          },
                                          child: Icon(
                                            mockedRoomModel.listOfBools[index]
                                                ? Icons.check_box
                                                : Icons.check_box_outline_blank,
                                          ),
                                        ),
                                        Text(feature),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 14 / 2,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0,
                              ),
                            ),
                          ),
                        )
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     Column(
                        //       mainAxisSize: MainAxisSize.min,
                        //       children: [
                        //         Row(
                        //           children: [
                        //             Icon(Icons.check_box_outline_blank),
                        //         Text('Wi-Fi'),
                        //           ],
                        //         ),
                        //         Row(
                        //           children: [
                        //             Icon(Icons.check_box_outline_blank),
                        //         Text('TV'),
                        //           ],
                        //         ),
                        //       ],
                        //     ),
                        //     Column(
                        //       mainAxisSize: MainAxisSize.min,
                        //       children: [
                        //         Icon(Icons.check_box_outline_blank),
                        //         Text('Projetor'),
                        //         Icon(Icons.check_box_outline_blank),
                        //         Text('Quadro Interativo'),
                        //       ],
                        //     ),
                        //     Column(
                        //       children: [
                        //         Icon(Icons.check_box_outline_blank),
                        //         Text('Tablet'),
                        //         Icon(Icons.check_box_outline_blank),
                        //         Text('Computador'),
                        //       ],
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  );
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
                      Navigator.pushNamed(context, '/reservation');
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
