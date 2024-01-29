import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getgoing_flutter/domain/repository/gg_repository.dart';
import 'package:getgoing_flutter/domain/repository/shared_preferences_manager.dart';
import 'package:getgoing_flutter/widgets/get_going_seek_bar.dart';
import '../domain/models/db_route.dart';

class MyActivities extends StatefulWidget {
  const MyActivities({super.key});

  @override
  State<MyActivities> createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {
  List<DbRoute>? allRoutes;
  double _sumWalk = 0.0;
  double _sumRun = 0.0;
  double _sumRide = 0.0;

  Future<List<DbRoute>> getAllDBRoutes() async {
    return await GGRepository.instance.getAllDBRoutes();
  }

  @override
  void initState() {
    super.initState();
    getAllDBRoutes().then((listOfRoutes) => _fillProgressBars(listOfRoutes));
  }

  void _fillProgressBars(List<DbRoute> allRoutes) async {
    int goal = await SharedPreferencesManager.getGoal();
    _sumWalk = 0.0;
    _sumRun = 0.0;
    _sumRide = 0.0;

    for (DbRoute route in allRoutes) {
      if (route.activityId == 1) {
        _sumWalk += route.length as double;
      } else if (route.activityId == 2) {
        _sumRun += route.length as double;
      } else if (route.activityId == 3) {
        _sumRide += route.length as double;
      }
    }

    setState(() {
      if (_sumWalk != 0) {
        _sumWalk = _sumWalk / goal;
      }
      if (_sumRun != 0) {
        _sumRun = _sumRun / goal;
      }
      if (_sumRide != 0) {
        _sumRide = _sumRide / goal;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0xf0, 0xf4, 0xf7, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0xf0, 0xf4, 0xf7, 1.0),
        title: const Text('My Activities'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Walking',
                          style: TextStyle(
                              color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                              fontSize: 18.0)),
                      Row(
                        children: [
                          Text('${_sumWalk / 1000} km',
                              style: const TextStyle(
                                  color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                                  fontSize: 18.0)),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                            size: 18.0,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  SizedBox(
                    height: 10.0,
                    child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(10.0),
                        value: _sumWalk,
                        // Set the progress value (0.0 to 1.0)
                        backgroundColor: Colors.white,
                        // Set the background color
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Color.fromRGBO(0x20, 0xba, 0xff, 1.0))),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Running',
                          style: TextStyle(
                              color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                              fontSize: 18.0)),
                      Row(
                        children: [
                          Text('${_sumRun / 1000} km',
                              style: const TextStyle(
                                  color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                                  fontSize: 18.0)),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                            size: 18.0,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  SizedBox(
                    height: 10.0,
                    child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(10.0),
                        value: _sumRun,
                        // Set the progress value (0.0 to 1.0)
                        backgroundColor: Colors.white,
                        // Set the background color
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Color.fromRGBO(0x20, 0xba, 0xff, 1.0))),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Cycling',
                          style: TextStyle(
                              color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                              fontSize: 18.0)),
                      Row(
                        children: [
                          Text('${_sumRide / 1000} km',
                              style: const TextStyle(
                                  color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                                  fontSize: 18.0)),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                            size: 18.0,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  SizedBox(
                    height: 10.0,
                    child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(10.0),
                        value: _sumRide,
                        // Set the progress value (0.0 to 1.0)
                        backgroundColor: Colors.white,
                        // Set the background color
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Color.fromRGBO(0x20, 0xba, 0xff, 1.0))),
                  ),
                  const SizedBox(height: 32.0)
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/ic_light_goal.svg',
                          width: 28.0,
                          height: 28.0,
                        ),
                        const SizedBox(width: 12.0),
                        const Text('MY GOAL',
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold))
                      ],
                    ),
                    const SizedBox(height: 22.0),
                    const GetGoingSeekBar()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
