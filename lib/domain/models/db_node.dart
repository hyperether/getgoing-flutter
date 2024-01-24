import 'dart:ffi';

class DbNode {
  final Long id;
  final Double latitude;
  final Double longitude;
  final Float velocity;
  final Long index;
  final bool last;
  final Long routeId;

  DbNode(
      {required this.id,
      required this.latitude,
      required this.longitude,
      required this.velocity,
      required this.index,
      required this.last,
      required this.routeId});

  factory DbNode.fromJson(Map<String, dynamic> map) {
    return DbNode(
      id: map['id'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      velocity: map['velocity'],
      index: map['index'],
      last: map['last'],
      routeId: map['routeId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'velocity': velocity,
      'index': index,
      'last': last,
      'routeId': routeId,
    };
  }
}
