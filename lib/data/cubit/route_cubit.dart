import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/db_route.dart';
import 'package:getgoing_flutter/data/repository/gg_repository.dart';
import '../repository/shared_preferences_manager.dart';

class RouteCubit extends Cubit<DbRoute> {
  final GGRepository repository = GGRepository.instance;
  List<DbRoute> routes = List.empty();
  DbRoute dbRoute = DbRoute.empty();
  double sumWalk = 0.0;
  double sumRun = 0.0;
  double sumRide = 0.0;
  double walkPercentage = 0.0;
  double runPercentage = 0.0;
  double ridePercentage = 0.0;
  bool doesRouteExist = false;
  String activityType = "";
  String percentageByType = "";
  double percentageByTypeInDouble = 0.0;

  RouteCubit() : super(DbRoute.empty());

  Future<void> getRoutes() async {
    try {
      routes = await repository.getAllDBRoutes();
      calculateLastRoute(routes);
      fillProgressBars(routes);
      emit(dbRoute);
    } catch (e) {
      print('Exception $e');
      emit(DbRoute.empty());
    }
  }

  DbRoute calculateLastRoute(List<DbRoute> allRoutes) {
    dbRoute = DbRoute.empty();
    if (allRoutes.isNotEmpty) {
      dbRoute = allRoutes.last;
    }
    return dbRoute;
  }

  void fillProgressBars(List<DbRoute> allRoutes) async {
    int goal = await SharedPreferencesManager.getGoal();
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

  void setActivityType(String type) {
    activityType = type;
  }

  calculatePercentageByType() {
    if (activityType == 'Walking') {
      percentageByType = '${(walkPercentage * 100).round()}%';
      percentageByTypeInDouble = walkPercentage;
    } else if (activityType == 'Running') {
      percentageByType = '${(runPercentage * 100).round()}%';
      percentageByTypeInDouble = runPercentage;
    } else if (activityType == 'Cycling') {
      percentageByType = '${(ridePercentage * 100).round()}%';
      percentageByTypeInDouble = ridePercentage;
    }
  }
}
