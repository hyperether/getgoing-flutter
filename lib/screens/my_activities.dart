import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getgoing_flutter/widgets/get_going_seek_bar.dart';

class MyActivities extends StatefulWidget {
  const MyActivities({super.key});

  @override
  State<MyActivities> createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {
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
                      Text('Walking',
                          style: TextStyle(
                              color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                              fontSize: 18.0)),
                      Row(
                        children: [
                          Text('0 km',
                              style: TextStyle(
                                  color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                                  fontSize: 18.0)),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                            size: 18.0,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Container(
                    height: 10.0,
                    child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(10.0),
                        value: 0.5, // Set the progress value (0.0 to 1.0)
                        backgroundColor: Colors.white, // Set the background color
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Color.fromRGBO(0x20, 0xba, 0xff, 1.0))),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Running',
                          style: TextStyle(
                              color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                              fontSize: 18.0)),
                      Row(
                        children: [
                          Text('0 km',
                              style: TextStyle(
                                  color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                                  fontSize: 18.0)),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                            size: 18.0,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Container(
                    height: 10.0,
                    child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(10.0),
                        value: 0.5, // Set the progress value (0.0 to 1.0)
                        backgroundColor: Colors.white, // Set the background color
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Color.fromRGBO(0x20, 0xba, 0xff, 1.0))),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cycling',
                          style: TextStyle(
                              color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                              fontSize: 18.0)),
                      Row(
                        children: [
                          Text('0 km',
                              style: TextStyle(
                                  color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                                  fontSize: 18.0)),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
                            size: 18.0,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Container(
                    height: 10.0,
                    child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(10.0),
                        value: 0.5, // Set the progress value (0.0 to 1.0)
                        backgroundColor: Colors.white, // Set the background color
                        valueColor: AlwaysStoppedAnimation<Color>(
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
                        Text('MY GOAL',
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold))
                      ],
                    ),
                    const SizedBox(height: 22.0),
                    GetGoingSeekBar()
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
