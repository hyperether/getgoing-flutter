import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getgoing_flutter/utils/app_constants.dart';
import '../widgets/no_routes_dialog.dart';

List<int> getTimeEstimates(double dist) {
  List<int> returnValues = List.generate(3, (index) => 0);
  returnValues[0] = dist ~/ (AppConst.avgSpeedWalk * 60);
  returnValues[1] = dist ~/ (AppConst.avgSpeedRun * 60);
  returnValues[2] = dist ~/ (AppConst.avgSpeedCycling * 60);
  return returnValues;
}


showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void showNoRoutesDialog(BuildContext context, int activityId) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return NoRoutesDialog(activityId: activityId);
    },
  );
}