import 'package:flutter/material.dart';
import 'package:innovareti_test/models/room_model.dart';
import 'package:innovareti_test/shared/theme/app_text_styles.dart';

import 'room_feature.dart';
import 'room_feature_set.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({
    Key? key,
    required this.size,
    required this.room,
  }) : super(key: key);

  final Size size;
  final RoomModel room;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      child: Card(
        elevation: 12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.35,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                child: FittedBox(
                    fit: BoxFit.fill, child: Image.asset(room.imageUrl)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    room.name,
                    style: AppTextStyles.roomName,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    child: Row(
                      children: [
                        const Text('Capacidade:  ',
                            style: AppTextStyles.roomFeatures),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.purple[900]),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: Text(
                              room.capacity.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 5,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.place,
                    color: Colors.purple[900],
                  ),
                  Text(room.address),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: RoomFeatureSet(room: room),
            )
          ],
        ),
      ),
    );
  }
}
