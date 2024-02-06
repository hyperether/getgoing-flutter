import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../domain/repository/gg_repository.dart';
import '../widgets/centered_horizontal_list_view.dart';

class GetGoingMain extends StatefulWidget {
  const GetGoingMain({super.key});

  @override
  State<GetGoingMain> createState() => _GetGoingMainState();
}

class _GetGoingMainState extends State<GetGoingMain> {
  var exerciseList = ["Running", "Cycling", "Walking"];

  Future<String> getDbPath() async {
    Future<String> result = GGRepository.instance.getDatabasePath();
    await result;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SvgPicture.asset('assets/ic_logo_small.svg',
                        width: 50.0, height: 50.0),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/profile');
                        setState(() {});
                      },
                      child: SvgPicture.asset('assets/ic_light_user.svg',
                          width: 30.0, height: 40.0),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Last exercise',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/activities');
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          Text(
                            'View all',
                            style: TextStyle(
                                color: Colors.blue[300], fontSize: 18.0),
                          ),
                          const SizedBox(width: 4.0),
                          SvgPicture.asset('assets/ic_light_chevron.svg',
                              width: 14.0, height: 14.0)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                child: Container(
                  height: 180.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(0x20, 0xba, 0xFF, 1.0),
                          Color.fromRGBO(0x6b, 0xd1, 0xFF, 1.0)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.0, 1.0]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Center(
                          child: CircularPercentIndicator(
                            radius: 60,
                            lineWidth: 5,
                            percent: 0.5,
                            progressColor: Colors.blue[700],
                            backgroundColor: Colors.white,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 12.0, 0.0, 12.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(
                                    'assets/ic_running_white.svg',
                                    // Update with the correct path
                                    width: 30.0,
                                    height: 24.0,
                                  ),
                                  const Text('50%',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white)),
                                  const Text('Running',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white))
                                ],
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: CircularPercentIndicator(
                            radius: 58,
                            lineWidth: 5,
                            percent: 0.25,
                            progressColor: Colors.blue[700],
                            backgroundColor: Colors.white,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 12.0, 0.0, 12.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(
                                    'assets/ic_timer.svg',
                                    // Update with the correct path
                                    width: 25.0,
                                    height: 25.0,
                                  ),
                                  const Text('25%',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white)),
                                  const Text('min',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Choose your exercise',
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              )),
                          const Text('Can we burn our legs?',
                              style: TextStyle(
                                  color:
                                      Color.fromRGBO(0x20, 0xba, 0xFF, 1.0),
                                  fontSize: 16.0))
                        ]),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                  width: double.infinity,
                  height: 150.0,
                  child:
                      CenteredHorizontalListView(exerciseList: exerciseList)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/tracking');
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(160.0, 45.0),
                      foregroundColor:
                          const Color.fromRGBO(0x6b, 0xd1, 0xff, 1.0),
                      backgroundColor:
                          const Color.fromRGBO(0x20, 0xba, 0xff, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30.0), // Set the border radius
                      ),
                      elevation: 4.0),
                  child: const Text(
                    'Get ready',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  )),
              const SizedBox(height: 16.0)
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    initDb();
    getDbPath().then((result) {
      print('Data: $result');
    }).catchError((error) {
      print('Error: $error');
    });
    super.initState();
  }
}

void initDb() async {
  await GGRepository.instance.database;
}
