import 'package:flutter/material.dart';
import 'package:innovareti_test/models/room_model.dart';
import 'package:innovareti_test/pages/home/widgets/room_feature.dart';

class RoomFeatureSet extends StatelessWidget {
  const RoomFeatureSet({
    Key? key,
    required this.room,
  }) : super(key: key);

  final RoomModel room;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        room.hasWifi
            ? const RoomFeature(
                feature: 'Wi-Fi',
              )
            : const SizedBox(),
        room.hasProjector
            ? const RoomFeature(
                feature: 'Projetor',
              )
            : const SizedBox(),
        room.hasBigScreenTv
            ? const RoomFeature(
                feature: 'TV',
              )
            : const SizedBox(),
        room.hasInteractiveBoard
            ? const RoomFeature(
                feature: 'Quadro Interativo',
              )
            : const SizedBox(),
        room.hasPersonalTablet
            ? const RoomFeature(
                feature: 'Tablet',
              )
            : const SizedBox(),
        room.hasPersonalComputer
            ? const RoomFeature(
                feature: 'Computer',
              )
            : const SizedBox(),
      ],
    );
  }
}
