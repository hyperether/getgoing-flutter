import 'dart:ffi';

class DbRoute {
  final Long id;
  final Long duration;
  final Double energy;
  final Double length;
  final String date;
  final bool last;
  final Double avgSpeed;
  final Double currentSpeed;
  final int activityId;
  final Long goal;

  DbRoute(
      {required this.id,
      required this.duration,
      required this.energy,
      required this.length,
      required this.date,
      required this.last,
      required this.avgSpeed,
      required this.currentSpeed,
      required this.activityId,
      required this.goal});

  factory DbRoute.fromJson(Map<String, dynamic> map) {
    return DbRoute(
      id: map['id'],
      duration: map['duration'],
      energy: map['energy'],
      length: map['length'],
      date: map['date'],
      last: map['last'] == 1,
      avgSpeed: map['avgSpeed'],
      currentSpeed: map['currentSpeed'],
      activityId: map['activityId'],
      goal: map['goal'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'duration': duration,
      'energy': energy,
      'length': length,
      'date': date,
      'last': last == true ? 1 : 0,
      'avgSpeed': avgSpeed,
      'currentSpeed': currentSpeed,
      'activityId': activityId,
      'goal': goal,
    };
  }
}
