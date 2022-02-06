class RoomModel {
  final String name;
  final String imageUrl;
  final String address;
  final int capacity;
  final bool hasWifi;
  final bool hasProjector;
  final bool hasInteractiveBoard;
  final bool hasBigScreenTv;
  final bool hasPersonalComputer;
  final bool hasPersonalTablet;
  RoomModel({
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.capacity,
    required this.hasWifi,
    required this.hasProjector,
    required this.hasInteractiveBoard,
    required this.hasBigScreenTv,
    required this.hasPersonalComputer,
    required this.hasPersonalTablet,
  });
}
