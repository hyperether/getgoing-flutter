import 'package:getgoing_flutter/utils/app_constants.dart';

List<int> getTimeEstimates(double dist) {
  List<int> returnValues = List.generate(3, (index) => 0);
  returnValues[0] = dist ~/ (AppConst.avgSpeedWalk * 60);
  returnValues[1] = dist ~/ (AppConst.avgSpeedRun * 60);
  returnValues[2] = dist ~/ (AppConst.avgSpeedCycling * 60);
  return returnValues;
}
