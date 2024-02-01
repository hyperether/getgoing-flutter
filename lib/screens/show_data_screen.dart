import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../widgets/dashed_divider.dart';

class ShowDataScreen extends StatefulWidget {
  final String data;

  const ShowDataScreen({required this.data, super.key});

  @override
  State<ShowDataScreen> createState() => _ShowDataScreenState();
}

class _ShowDataScreenState extends State<ShowDataScreen> {
  String? _activityId = null;

  @override
  void initState() {
    super.initState();
    _activityId = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(0xf0, 0xf4, 0xf7, 1.0),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(0xf0, 0xf4, 0xf7, 1.0),
          title: Text(_activityId ?? ""),
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
          ],
        ),
        body: Column(
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
                    // Set the percentage to 100%
                    center: Text(
                      '69%', // Displayed text in the center
                      style: TextStyle(fontSize: 20.0),
                    ),
                    // Calculate the sweep angle for 2/3 of the circle (240 degrees)
                    arcType: ArcType.HALF,

                    // Display 3/4 of a round
                    progressColor: Colors.blue[700],
                    arcBackgroundColor: Colors.blue[100],
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                ),
                SizedBox(width: 8.0),
                // SvgPicture.asset(
                //   'assets/ic_light_goal.svg',
                //   // Update with the correct path
                //   width: 28.0,
                //   height: 28.0,
                // ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Calories'),
                    SizedBox(height: 8.0),
                    Text('334',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8.0),
                    Text('kcal'),
                  ],
                ),
                Column(
                  children: [
                    Text('Distance'),
                    SizedBox(height: 8.0),
                    Text('354',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8.0),
                    Text('km'),
                  ],
                ),
                Column(
                  children: [
                    Text('Speed'),
                    SizedBox(height: 8.0),
                    Text('334',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8.0),
                    Text('m/s'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32.0),
            Container(
                height: 120.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 8.0),
                    SvgPicture.asset(
                      'assets/ic_arrow_up.svg',
                      // Update with the correct path
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
                    Row(),
                    Row(),
                    Row(),
                  ],
                )),
          ],
        ));
  }
}
