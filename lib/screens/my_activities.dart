import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getgoing_flutter/domain/models/db_node.dart';
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
  double walkPercentage = 0.0;
  double runPercentage = 0.0;
  double ridePercentage = 0.0;
  bool _doesRouteExisting = false;

  Future<List<DbNode>> getAllDBNodes() async {
    return await GGRepository.instance.getAllDbNodes();
  }

  Future<List<DbRoute>> getAllDBRoutes() async {
    return await GGRepository.instance.getAllDBRoutes();
  }

  _doesWalkRouteExist() async {
    bool doesRouteExisting =
        await SharedPreferencesManager.doesWalkRouteExist();
    setState(() {
      _doesRouteExisting = doesRouteExisting;
    });
  }

  // _insertNode() async {
  //   DbNode node = DbNode(
  //       latitude: 44.787197,
  //       longitude: 20.457273,
  //       velocity: 150.0,
  //       number: 11,
  //       last: false,
  //       routeId: 1);
  //   int insertedId = await GGRepository.instance.insertDbNode(dbNode: node);
  //   print('Inserted ID: $insertedId');
  // }

  // _insertRoute() async {
  //   DbRoute route = DbRoute(
  //       duration: 100,
  //       energy: 2.0,
  //       length: 155.15,
  //       date: "2024-01-25",
  //       avgSpeed: 10.0,
  //       currentSpeed: 15.0,
  //       activityId: 3,
  //       goal: 6000);
  //   int insertedId = await GGRepository.instance.insertDbRoute(dbRoute: route);
  //   print('Inserted ID: $insertedId');
  // }

  // _updateRoute() async {
  //   DbRoute route = DbRoute(
  //       id: 6,
  //       duration: 100,
  //       energy: 2.0,
  //       length: 150.0,
  //       date: "2024-01-25",
  //       avgSpeed: 1.0,
  //       currentSpeed: 5.0,
  //       activityId: 1,
  //       goal: 6000);
  //   int updatedId = await GGRepository.instance.updateRoute(route);
  //   print('Updated ID: $updatedId');
  // }

  @override
  void initState() {
    super.initState();
    //_updateRoute();
    //_insertNode();
    //_insertRoute();
    //_getAllDBRoutes();
    _doesWalkRouteExist();
    getAllDBRoutes().then((listOfRoutes) => _fillProgressBars(listOfRoutes));
  }

  void _fillProgressBars(List<DbRoute> allRoutes) async {
    int goal = await SharedPreferencesManager.getGoal();

    for (DbRoute route in allRoutes) {
      print('Route: $route');

      if (route.activityId == 1) {
        _sumWalk += route.length;
      } else if (route.activityId == 2) {
        _sumRun += route.length;
      } else if (route.activityId == 3) {
        _sumRide += route.length;
      }
    }

    setState(() {
      if (_sumWalk != 0) {
        walkPercentage = double.parse((_sumWalk / goal).toStringAsFixed(2));
      }
      if (_sumRun != 0) {
        runPercentage = double.parse((_sumRun / goal).toStringAsFixed(2));
      }
      if (_sumRide != 0) {
        ridePercentage = double.parse((_sumRide / goal).toStringAsFixed(2));
      }
      print('walkPercentage: $walkPercentage');
      print('runPercentage: $runPercentage');
      print('ridePercentage: $ridePercentage');
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
                      InkWell(
                        onTap: () async {
                          if (!_doesRouteExisting) {
                            await Navigator.pushNamed(context, '/showData',
                                arguments: 'Walking');
                          }
                        },
                        child: Row(
                          children: [
                            Text('${_sumWalk / 1000} km',
                                style: const TextStyle(
                                    color:
                                        Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                                    fontSize: 18.0)),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                              size: 18.0,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  SizedBox(
                    height: 10.0,
                    child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(10.0),
                        value: walkPercentage,
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
                      InkWell(
                        onTap: () async {
                          if (!_doesRouteExisting) {
                            await Navigator.pushNamed(context, '/showData',
                                arguments: 'Running');
                          }
                        },
                        child: Row(
                          children: [
                            Text('${_sumRun / 1000} km',
                                style: const TextStyle(
                                    color:
                                        Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                                    fontSize: 18.0)),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                              size: 18.0,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  SizedBox(
                    height: 10.0,
                    child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(10.0),
                        value: runPercentage,
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
                      InkWell(
                        onTap: () async {
                          if (!_doesRouteExisting) {
                            await Navigator.pushNamed(context, '/showData',
                                arguments: 'Cycling');
                          }
                        },
                        child: Row(
                          children: [
                            Text('${_sumRide / 1000} km',
                                style: const TextStyle(
                                    color:
                                        Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                                    fontSize: 18.0)),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                              size: 18.0,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  SizedBox(
                    height: 10.0,
                    child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(10.0),
                        value: ridePercentage,
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
