import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getgoing_flutter/data/cubit/route_cubit.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../models/db_route.dart';
import '../data/providers/route_provider.dart';
import '../widgets/dashed_divider.dart';

class ShowDataScreen extends StatefulWidget {
  const ShowDataScreen({super.key});

  @override
  State<ShowDataScreen> createState() => _ShowDataScreenState();
}

class _ShowDataScreenState extends State<ShowDataScreen> {
  final routeCubit = RouteCubit();
  List<DbRoute> routes = [];

  @override
  void initState() {
    super.initState();
    routeCubit.getRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RouteProvider>(builder: (context, routes, child) {
      return Scaffold(
          backgroundColor: const Color.fromRGBO(0xf0, 0xf4, 0xf7, 1.0),
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(0xf0, 0xf4, 0xf7, 1.0),
            title: Text(routes.activityType ?? ""),
            elevation: 0,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
            ],
          ),
          body: RouteList(routeCubit: routeCubit, routes: routes));
    });
  }
}

class RouteList extends StatelessWidget {
  final RouteCubit routeCubit;
  final RouteProvider routes;

  const RouteList({super.key, required this.routeCubit, required this.routes});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteCubit, DbRoute>(
      bloc: routeCubit,
      builder: (context, route) {
        return ListView(
          children: [
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircularPercentIndicator(
                    radius: 150.0,
                    lineWidth: 12.0,
                    percent: 0.7,
                    center: Text('69%',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    arcType: ArcType.HALF,
                    progressColor: Colors.blue[700],
                    arcBackgroundColor: Colors.blue[100],
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                ),
                SizedBox(width: 8.0),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Calories'),
                    SizedBox(height: 8.0),
                    Text('${route.energy}',
                        style: const TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8.0),
                    Text('kcal'),
                  ],
                ),
                Column(
                  children: [
                    Text('Distance'),
                    SizedBox(height: 8.0),
                    Text('${route.length}',
                        style: const TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8.0),
                    Text('km'),
                  ],
                ),
                Column(
                  children: [
                    Text('Speed'),
                    SizedBox(height: 8.0),
                    Text('${route.avgSpeed}',
                        style: const TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8.0),
                    Text('m/s'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32.0),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(height: 8.0),
                  SvgPicture.asset(
                    'assets/ic_arrow_up.svg',
                    width: 24.0,
                    height: 20.0,
                  ),
                  SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Goal  '),
                        DashedDivider(),
                        Text('  2.3 km'),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: routeCubit.routes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 1.0,
                          horizontal: 4.0,
                        ),
                        child: ListTile(
                          onTap: () {},
                          title: Text('${routeCubit.routes[index]}'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
