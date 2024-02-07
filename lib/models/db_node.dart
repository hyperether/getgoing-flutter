class DbNode {
  int? id;
  final double latitude;
  final double longitude;
  final double velocity;
  final double number;
  final bool last;
  final int routeId;

  DbNode(
      {this.id,
      required this.latitude,
      required this.longitude,
      required this.velocity,
      required this.number,
      required this.last,
      required this.routeId});

  factory DbNode.fromJson(Map<String, dynamic> map) {
    return DbNode(
      //id: map['id'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      velocity: map['velocity'],
      number: map['number'],
      last: map['last'] == 1,
      routeId: map['routeId'],
    )..id ??= map['id'] as int?;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'velocity': velocity,
      'number': number,
      'last': last == true ? 1 : 0,
      'routeId': routeId,
    };
  }
}
