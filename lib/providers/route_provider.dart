import 'package:flutter/foundation.dart';
import 'package:getgoing_flutter/domain/models/db_route.dart';
import '../domain/repository/gg_repository.dart';
import '../domain/repository/shared_preferences_manager.dart';

class RouteProvider extends ChangeNotifier {
  final GGRepository _repository = GGRepository.instance;
  late List<DbRoute> routes;
  double sumWalk = 0.0;
  double sumRun = 0.0;
  double sumRide = 0.0;
  double walkPercentage = 0.0;
  double runPercentage = 0.0;
  double ridePercentage = 0.0;
  bool doesRouteExist = false;

  Future<List<DbRoute>> getAllDBRoutes() async {
    routes = await _repository.getAllDBRoutes();
    fillProgressBars(routes);
    return routes;
  }

  void fillProgressBars(List<DbRoute> allRoutes) async {
    int goal = await SharedPreferencesManager.getGoal();

    // Reset variables before recalculating
    sumWalk = 0.0;
    sumRun = 0.0;
    sumRide = 0.0;
    walkPercentage = 0.0;
    runPercentage = 0.0;
    ridePercentage = 0.0;

    for (DbRoute route in allRoutes) {
      if (route.activityId == 1) {
        sumWalk += route.length;
      } else if (route.activityId == 2) {
        sumRun += route.length;
      } else if (route.activityId == 3) {
        sumRide += route.length;
      }
    }
    if (sumWalk != 0) {
      walkPercentage = double.parse((sumWalk / goal).toStringAsFixed(2));
    }
    if (sumRun != 0) {
      runPercentage = double.parse((sumRun / goal).toStringAsFixed(2));
    }
    if (sumRide != 0) {
      ridePercentage = double.parse((sumRide / goal).toStringAsFixed(2));
    }
  }

  doesWalkRouteExist() async {
    bool doesRouteExisting =
        await SharedPreferencesManager.doesWalkRouteExist();
    doesRouteExist = doesRouteExisting;
  }
}
