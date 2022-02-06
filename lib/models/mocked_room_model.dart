import 'package:innovareti_test/models/room_model.dart';

class MockedRoomModel {
  List<String> listOfFeaturesToCheck = [
    'Wi-Fi',
    'TV',
    'Projetor',
    'Quadro Interativo',
    'Tablet',
    'Computador',
  ];

  List<bool> listOfBools = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  final listOfModels = [
    RoomModel(
      name: 'Sala Um',
      imageUrl: 'assets/images/room_one.jpg',
      capacity: 8,
      address: 'Av. Bom Senhor, 3454 - São Paulo.',
      hasBigScreenTv: true,
      hasInteractiveBoard: true,
      hasPersonalComputer: false,
      hasPersonalTablet: true,
      hasProjector: false,
      hasWifi: true,
    ),
    RoomModel(
      name: 'Sala Dois',
      imageUrl: 'assets/images/room_two.jpg',
      capacity: 5,
      address: 'Av. Bom Senhor, 3454 - São Paulo.',
      hasBigScreenTv: true,
      hasInteractiveBoard: false,
      hasPersonalComputer: false,
      hasPersonalTablet: false,
      hasProjector: false,
      hasWifi: true,
    ),
    RoomModel(
      name: 'Sala Três',
      imageUrl: 'assets/images/room_three.jpg',
      capacity: 7,
      address: 'Av. Bom Senhor, 3454 - São Paulo.',
      hasBigScreenTv: true,
      hasInteractiveBoard: false,
      hasPersonalComputer: false,
      hasPersonalTablet: false,
      hasProjector: false,
      hasWifi: true,
    ),
    RoomModel(
      name: 'Sala Quatro',
      imageUrl: 'assets/images/room_four.jpg',
      capacity: 12,
      address: 'Av. Bom Senhor, 3454 - São Paulo.',
      hasBigScreenTv: true,
      hasInteractiveBoard: true,
      hasPersonalComputer: true,
      hasPersonalTablet: true,
      hasProjector: false,
      hasWifi: true,
    ),
    RoomModel(
      name: 'Sala Cinco',
      imageUrl: 'assets/images/room_five.jpg',
      capacity: 16,
      address: 'Av. Bom Senhor, 3454 - São Paulo.',
      hasBigScreenTv: false,
      hasInteractiveBoard: true,
      hasPersonalComputer: false,
      hasPersonalTablet: true,
      hasProjector: true,
      hasWifi: true,
    ),
    RoomModel(
      name: 'Sala Seis',
      imageUrl: 'assets/images/room_six.jpg',
      capacity: 6,
      address: 'Av. Bom Senhor, 3454 - São Paulo.',
      hasBigScreenTv: true,
      hasInteractiveBoard: true,
      hasPersonalComputer: false,
      hasPersonalTablet: true,
      hasProjector: false,
      hasWifi: true,
    ),
    RoomModel(
      name: 'Sala Sete',
      imageUrl: 'assets/images/room_seven.jpg',
      capacity: 10,
      address: 'Av. Bom Senhor, 3454 - São Paulo.',
      hasBigScreenTv: true,
      hasInteractiveBoard: true,
      hasPersonalComputer: false,
      hasPersonalTablet: true,
      hasProjector: false,
      hasWifi: true,
    ),
    RoomModel(
      name: 'Sala Oito',
      imageUrl: 'assets/images/room_eight.jpg',
      capacity: 12,
      address: 'Av. Bom Senhor, 3454 - São Paulo.',
      hasBigScreenTv: true,
      hasInteractiveBoard: true,
      hasPersonalComputer: false,
      hasPersonalTablet: true,
      hasProjector: false,
      hasWifi: true,
    ),
    RoomModel(
      name: 'Sala Nove',
      imageUrl: 'assets/images/room_nine.jpg',
      capacity: 14,
      address: 'Av. Bom Senhor, 3454 - São Paulo.',
      hasBigScreenTv: true,
      hasInteractiveBoard: true,
      hasPersonalComputer: false,
      hasPersonalTablet: true,
      hasProjector: false,
      hasWifi: true,
    ),
    RoomModel(
      name: 'Sala Dez',
      imageUrl: 'assets/images/room_ten.jpg',
      capacity: 8,
      address: 'Av. Bom Senhor, 3454 - São Paulo.',
      hasBigScreenTv: true,
      hasInteractiveBoard: true,
      hasPersonalComputer: false,
      hasPersonalTablet: true,
      hasProjector: false,
      hasWifi: true,
    ),
  ];
}