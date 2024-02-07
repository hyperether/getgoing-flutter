class DbRoute {
  int? id;
  final int duration;
  final double energy;
  final double length;
  final String date;
  final double avgSpeed;
  final double currentSpeed;
  final int activityId;
  final int goal;

  // Named constructor
  DbRoute.empty()
      : id = null,
        duration = 0,
        energy = 0,
        length = 0,
        date = '',
        avgSpeed = 0,
        currentSpeed = 0,
        activityId = 0,
        goal = 0;

  DbRoute(
      {this.id,
      required this.duration,
      required this.energy,
      required this.length,
      required this.date,
      required this.avgSpeed,
      required this.currentSpeed,
      required this.activityId,
      required this.goal});

  factory DbRoute.fromJson(Map<String, dynamic> map) {
    return DbRoute(
      duration: map['duration'],
      energy: map['energy'],
      length: map['length'],
      date: map['date'],
      avgSpeed: map['avgSpeed'],
      currentSpeed: map['currentSpeed'],
      activityId: map['activityId'],
      goal: map['goal'],
    )..id ??= map['id'] as int?;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'duration': duration,
      'energy': energy,
      'length': length,
      'date': date,
      'avgSpeed': avgSpeed,
      'currentSpeed': currentSpeed,
      'activityId': activityId,
      'goal': goal,
    };
  }

  @override
  String toString() {
    return 'DbRoute{id: $id, '
        'duration: $duration, '
        'energy: $energy, '
        'length: $length, '
        'date: $duration, '
        'avgSpeed: $avgSpeed, '
        'currentSpeed: $currentSpeed, '
        'activityId: $activityId, '
        'goal: $goal}';
  }
}
