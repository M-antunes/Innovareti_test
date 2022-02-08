class RoomModel {
  final int? id;
  final String name;
  final String imageUrl;
  final String address;
  final int capacity;
  String? type;
  final bool hasWifi;
  final bool hasProjector;
  final bool hasInteractiveBoard;
  final bool hasBigScreenTv;
  final bool hasPersonalComputer;
  final bool hasPersonalTablet;
  bool hasCheckedIn;
  RoomModel({
    this.id,
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.capacity,
    this.type,
    required this.hasWifi,
    required this.hasProjector,
    required this.hasInteractiveBoard,
    required this.hasBigScreenTv,
    required this.hasPersonalComputer,
    required this.hasPersonalTablet,
    this.hasCheckedIn = false,
  });
}
