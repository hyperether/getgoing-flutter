import 'package:flutter/material.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  @override
  Widget build(BuildContext context) {
    double parentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0xf0, 0xf4, 0xf7, 1.0),
        title: const Text('Walking'),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: const Color.fromRGBO(0xf0, 0xf4, 0xf7, 1.0),
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Text(
                'Map fragment',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Color.fromRGBO(0xff, 0xfe, 0xff, 1.0),
                height: 140,
                child: Center(
                  child: const Text(
                    'Set goal for this exercise',
                    style: TextStyle(
                        color: Color.fromRGBO(0x20, 0xba, 0xff, 1.0),
                        fontSize: 22.0),
                  ),
                ),
              )
            ],
          ),
          Positioned(
              left: (parentWidth - 160.0) / 2,
              bottom: 100,
              child: Center(
                child: ClipOval(
                  child: Container(
                    color: const Color.fromRGBO(0xf0, 0xf4, 0xf7, 1.0),
                    width: 160.0,
                    height: 160.0,
                  ),
                ),
              )),
          Positioned(
            left: (parentWidth - 120.0) / 2,
            // Adjust the width of the child accordingly
            bottom: 140.0,
            child: ClipOval(
                child: Container(
              color: Color.fromRGBO(0xff, 0xff, 0xff, 0.8),
              width: 120.0,
              height: 120.0,
              child: Center(
                child: ClipOval(
                  child: Container(
                      color: Color.fromRGBO(0xff, 0xfe, 0xff, 1.0),
                      width: 100.0,
                      height: 100.0,
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Color.fromRGBO(0x20, 0xba, 0xff, 1.0),
                        size: 100.0,
                      )),
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }
}
