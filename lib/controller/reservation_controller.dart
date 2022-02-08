import 'package:flutter/material.dart';
import 'package:innovareti_test/models/mocked_room_model.dart';
import 'package:innovareti_test/models/room_model.dart';

class ReservationController extends ChangeNotifier {
  MockedRoomModel mockedRoomModel = MockedRoomModel();
  List<RoomModel> rooms = [];
  List<RoomModel> filteredRooms = [];
  List<RoomModel> roomsReserved = [];

  List<Map<String, dynamic>> featureFilters = [
    {'name': 'Wi-Fi', 'isChecked': false},
    {'name': 'TV', 'isChecked': false},
    {'name': 'Quadro Interativo', 'isChecked': false},
    {'name': 'Tablet', 'isChecked': false},
    {'name': 'Projetor', 'isChecked': false},
    {'name': 'Computador', 'isChecked': false},
  ];

  List<Map<String, dynamic>> capacityFilters = [
    {'name': '0 - 5'},
    {'name': '6 - 10'},
    {'name': '11 - 15'},
    {'name': '16 - 20'},
  ];

  int capacitySelected = -1;

  void getRooms() {
    rooms = mockedRoomModel.listOfModels;
    filteredRooms = rooms;
  }

  void filter() {
    List<RoomModel> temporaryFiltered = List.from(rooms);
    for (var feature in featureFilters) {
      if (feature['isChecked'] && feature['name'] == 'Wi-Fi') {
        temporaryFiltered =
            temporaryFiltered.where((element) => element.hasWifi).toList();
      } else if (feature['isChecked'] && feature['name'] == 'TV') {
        temporaryFiltered = temporaryFiltered
            .where((element) => element.hasBigScreenTv)
            .toList();
      } else if (feature['isChecked'] &&
          feature['name'] == 'Quadro Interativo') {
        temporaryFiltered = temporaryFiltered
            .where((element) => element.hasInteractiveBoard)
            .toList();
      } else if (feature['isChecked'] && feature['name'] == 'Tablet') {
        temporaryFiltered = temporaryFiltered
            .where((element) => element.hasPersonalTablet)
            .toList();
      } else if (feature['isChecked'] && feature['name'] == 'Projetor') {
        temporaryFiltered =
            temporaryFiltered.where((element) => element.hasProjector).toList();
      } else if (feature['isChecked'] && feature['name'] == 'Computador') {
        temporaryFiltered = temporaryFiltered
            .where((element) => element.hasPersonalComputer)
            .toList();
      }
    }
    if (capacitySelected > -1) {
      var capacity = capacityFilters.elementAt(capacitySelected);
      if (capacity['name'] == '0 - 5') {
        temporaryFiltered =
            temporaryFiltered.where((element) => element.capacity < 6).toList();
      } else if (capacity['name'] == '6 - 10') {
        temporaryFiltered = temporaryFiltered
            .where((element) => element.capacity >= 6 && element.capacity <= 10)
            .toList();
      } else if (capacity['name'] == '11 - 15') {
        temporaryFiltered = temporaryFiltered
            .where(
                (element) => element.capacity >= 11 && element.capacity <= 15)
            .toList();
      } else if (capacity['name'] == '16 - 20') {
        temporaryFiltered = temporaryFiltered
            .where(
                (element) => element.capacity >= 16 && element.capacity <= 20)
            .toList();
      }
    }
    filteredRooms = temporaryFiltered;
    notifyListeners();
  }

  bool chekIfRoomIsAlreadyReserved(RoomModel room) {
    for (var newRoom in roomsReserved) {
      if (newRoom.id == room.id) {
        return true;
      }
    }
    return false;
  }

  void fillReservedRooms(RoomModel room) {
    roomsReserved.add(room);
    notifyListeners();
  }
}
