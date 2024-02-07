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
  @override
  Widget build(BuildContext context) {
    final routeCubit = BlocProvider.of<RouteCubit>(context);
    routeCubit.getRoutes();
    return Consumer<RouteProvider>(builder: (context, routes, child) {
      return Scaffold(
          backgroundColor: const Color.fromRGBO(0xf0, 0xf4, 0xf7, 1.0),
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(0xf0, 0xf4, 0xf7, 1.0),
            title: Text(routes.activityType),
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
    routeCubit.calculatePercentageByType();

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
                    percent: routeCubit.percentageByTypeInDouble,
                    center: Text(
                      routeCubit.percentageByType,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    arcType: ArcType.HALF,
                    progressColor: Colors.blue[700],
                    arcBackgroundColor: Colors.blue[100],
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                ),
                const SizedBox(width: 8.0),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text('Calories'),
                    const SizedBox(height: 8.0),
                    Text('${route.energy}',
                        style: const TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8.0),
                    const Text('kcal'),
                  ],
                ),
                Column(
                  children: [
                    const Text('Distance'),
                    const SizedBox(height: 8.0),
                    Text('${route.length}',
                        style: const TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8.0),
                    const Text('km'),
                  ],
                ),
                Column(
                  children: [
                    const Text('Speed'),
                    const SizedBox(height: 8.0),
                    Text('${route.avgSpeed}',
                        style: const TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8.0),
                    const Text('m/s'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32.0),
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
                  const SizedBox(height: 8.0),
                  SvgPicture.asset(
                    'assets/ic_arrow_up.svg',
                    width: 24.0,
                    height: 20.0,
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Goal  '),
                        const DashedDivider(),
                        Text('  ${route.goal} km'),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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
