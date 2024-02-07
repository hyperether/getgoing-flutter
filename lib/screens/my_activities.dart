import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getgoing_flutter/data/providers/route_provider.dart';
import 'package:getgoing_flutter/widgets/get_going_seek_bar.dart';
import 'package:provider/provider.dart';
import '../../models/db_route.dart';
import '../data/cubit/route_cubit.dart';
import '../utils/utility_functions.dart';

class MyActivities extends StatefulWidget {
  const MyActivities({super.key});

  @override
  State<MyActivities> createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {
  @override
  Widget build(BuildContext context) {
    final routeCubit = BlocProvider.of<RouteCubit>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0xf0, 0xf4, 0xf7, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0xf0, 0xf4, 0xf7, 1.0),
        title: const Text('My Activities'),
        elevation: 0,
      ),
      body: Consumer<RouteProvider>(
        builder: (_, routes, child) {
          print('Routes data: $routes');
          return FutureBuilder<List<DbRoute>>(
              future: routes.getAllDBRoutes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Walking',
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              0x47, 0x47, 0x47, 1.0),
                                          fontSize: 18.0)),
                                  InkWell(
                                    onTap: () async {
                                      if (!routes.doesRouteExist) {
                                        routes.setActivityType('Walking');
                                        routeCubit.setActivityType('Walking');
                                        await Navigator.pushNamed(
                                            context, '/showData');
                                      } else {
                                        showNoRoutesDialog(context, 0);
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                            '${(routes.sumWalk / 1000).toStringAsFixed(2)} km',
                                            style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    0x47, 0x47, 0x47, 1.0),
                                                fontSize: 18.0)),
                                        const Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color.fromRGBO(
                                              0x47, 0x47, 0x47, 1.0),
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
                                    value: routes.walkPercentage,
                                    // Set the progress value (0.0 to 1.0)
                                    backgroundColor: Colors.white,
                                    // Set the background color
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Color.fromRGBO(
                                                0x20, 0xba, 0xff, 1.0))),
                              ),
                              const SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Running',
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              0x47, 0x47, 0x47, 1.0),
                                          fontSize: 18.0)),
                                  InkWell(
                                    onTap: () async {
                                      if (!routes.doesRouteExist) {
                                        routes.setActivityType('Running');
                                        routeCubit.setActivityType('Running');
                                        await Navigator.pushNamed(
                                            context, '/showData');
                                      } else {
                                        return showNoRoutesDialog(context, 1);
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                            '${(routes.sumRun / 1000).toStringAsFixed(2)} km',
                                            style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    0x47, 0x47, 0x47, 1.0),
                                                fontSize: 18.0)),
                                        const Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color.fromRGBO(
                                              0x47, 0x47, 0x47, 1.0),
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
                                    value: routes.runPercentage,
                                    // Set the progress value (0.0 to 1.0)
                                    backgroundColor: Colors.white,
                                    // Set the background color
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Color.fromRGBO(
                                                0x20, 0xba, 0xff, 1.0))),
                              ),
                              const SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Cycling',
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              0x47, 0x47, 0x47, 1.0),
                                          fontSize: 18.0)),
                                  InkWell(
                                    onTap: () async {
                                      if (!routes.doesRouteExist) {
                                        routes.setActivityType('Cycling');
                                        routeCubit.setActivityType('Cycling');
                                        await Navigator.pushNamed(
                                            context, '/showData');
                                      } else {
                                        return showNoRoutesDialog(context, 2);
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                            '${(routes.sumRide / 1000).toStringAsFixed(2)} km',
                                            style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    0x47, 0x47, 0x47, 1.0),
                                                fontSize: 18.0)),
                                        const Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color.fromRGBO(
                                              0x47, 0x47, 0x47, 1.0),
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
                                    value: routes.ridePercentage,
                                    // Set the progress value (0.0 to 1.0)
                                    backgroundColor: Colors.white,
                                    // Set the background color
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Color.fromRGBO(
                                                0x20, 0xba, 0xff, 1.0))),
                              ),
                              const SizedBox(height: 32.0)
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                16.0, 24.0, 16.0, 0.0),
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
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold))
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
                  );
                }
              });
        },
      ),
    );
  }
}
