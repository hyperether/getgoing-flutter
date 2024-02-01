import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getgoing_flutter/domain/repository/shared_preferences_manager.dart';
import 'package:getgoing_flutter/utils/app_constants.dart';
import 'package:getgoing_flutter/widgets/gg_alert_dialog.dart';
import '../utils/utility_functions.dart';

class GetGoingSeekBar extends StatefulWidget {
  const GetGoingSeekBar({super.key});

  @override
  State<GetGoingSeekBar> createState() => _GetGoingSeekBarState();
}

class _GetGoingSeekBarState extends State<GetGoingSeekBar> {
  double _goal = 0.0;
  int _goalInt = 0;
  int _cal = 0;
  int _weight = 0;
  List<int>? _timeEstimates;

  @override
  void initState() {
    super.initState();
    _initLabels();
  }

  _initLabels() async {
    int value = await SharedPreferencesManager.getGoal();
    int weight = await SharedPreferencesManager.getWeight();
    setState(() {
      _goal = value.toDouble();
      _goalInt = value;
      _timeEstimates = getTimeEstimates(_goal);
      int cal = (_goalInt * 0.00112 * weight).toInt();
      _cal = cal;
      _weight = weight;
    });
  }

  Future<void> _showAlertDialog(BuildContext context, int goal) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return GGAlertDialog(
          callback: (int goal) {
            setState(() {
              _goal = goal.toDouble();
              _goalInt = goal;
              _timeEstimates = getTimeEstimates(_goal);
              int cal = (_goalInt * 0.00112 * _weight).toInt();
              _cal = cal;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text('${_goal.toInt()}',
              style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0))),
          const SizedBox(width: 4.0),
          const Text('meters'),
          const SizedBox(width: 32.0)
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text('About $_cal kcal', style: const TextStyle(fontSize: 12.0)),
          const SizedBox(width: 32.0)
        ]),
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 0.0),
          child: Slider(
              value: _goal,
              //divisions: 10,
              onChanged: (double newValue) {
                setState(() {
                  _goal = newValue;
                  _goalInt = newValue.toInt();
                  _timeEstimates = getTimeEstimates(newValue);
                  _cal = (newValue * 0.00112 * _weight).toInt();
                });
              },
              activeColor: const Color.fromRGBO(0x20, 0xba, 0xff, 1.0),
              inactiveColor: const Color.fromRGBO(0xf0, 0xf4, 0xf7, 1.0),
              min: 0.0,
              max: 10000.0),
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(64.0, 0.0, 64.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Text('LOW',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: (_goalInt >= 0 && _goalInt <= 3333)
                            ? const Color.fromRGBO(0x20, 0xba, 0xff, 1.0)
                            : const Color.fromRGBO(0x47, 0x47, 0x47, 1.0))),
                onTap: () {
                  setState(() {
                    _goal = AppConst.lowDistance.toDouble();
                    _goalInt = AppConst.lowDistance;
                    _timeEstimates =
                        getTimeEstimates(AppConst.lowDistance.toDouble());
                    _cal = (AppConst.lowDistance.toDouble() * 0.00112 * _weight)
                        .toInt();
                  });
                },
              ),
              const Text('|'),
              InkWell(
                child: Text('MEDIUM',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: (_goalInt > 3333 && _goalInt <= 6666)
                            ? const Color.fromRGBO(0x20, 0xba, 0xff, 1.0)
                            : const Color.fromRGBO(0x47, 0x47, 0x47, 1.0))),
                onTap: () {
                  setState(() {
                    _goal = AppConst.mediumDistance.toDouble();
                    _goalInt = AppConst.mediumDistance;
                    _timeEstimates =
                        getTimeEstimates(AppConst.mediumDistance.toDouble());
                    _cal =
                        (AppConst.mediumDistance.toDouble() * 0.00112 * _weight)
                            .toInt();
                  });
                },
              ),
              const Text('|'),
              InkWell(
                child: Text('HIGH',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: (_goalInt > 6666 && _goalInt <= 10000)
                            ? const Color.fromRGBO(0x20, 0xba, 0xff, 1.0)
                            : const Color.fromRGBO(0x47, 0x47, 0x47, 1.0))),
                onTap: () {
                  setState(() {
                    _goal = AppConst.highDistance.toDouble();
                    _goalInt = AppConst.highDistance;
                    _timeEstimates =
                        getTimeEstimates(AppConst.highDistance.toDouble());
                    _cal =
                        (AppConst.highDistance.toDouble() * 0.00112 * _weight)
                            .toInt();
                  });
                },
              )
            ],
          ),
        ),
        const SizedBox(height: 32.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.directions_walk,
                color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0), size: 32.0),
            Text('${_timeEstimates?[0]}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(width: 2.0),
            const Text('min', style: TextStyle(fontSize: 16.0)),
            const SizedBox(width: 8.0),
            const Text('or', style: TextStyle(fontSize: 16.0)),
            const SizedBox(width: 8.0),
            const Icon(Icons.directions_run,
                color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0), size: 32.0),
            Text('${_timeEstimates?[1]}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(width: 2.0),
            const Text('min', style: TextStyle(fontSize: 16.0)),
            const SizedBox(width: 8.0),
            const Text('or', style: TextStyle(fontSize: 16.0)),
            const SizedBox(width: 8.0),
            SvgPicture.asset(
              'assets/ic_cycling_light.svg',
              width: 28.0,
              height: 28.0,
            ),
            const SizedBox(width: 2.0),
            Text('${_timeEstimates?[2]}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(width: 4.0),
            const Text('min', style: TextStyle(fontSize: 16.0))
          ],
        ),
        const SizedBox(height: 36.0),
        ElevatedButton(
            onPressed: () {
              if (_goal == 0.0) {
                _showAlertDialog(context, _goalInt);
              } else {
                SharedPreferencesManager.setGoal(_goalInt);
                showToast('Your goal is updated');
                Navigator.of(context).pop();
              }
            },
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(160.0, 40.0),
                foregroundColor: const Color.fromRGBO(0x6b, 0xd1, 0xff, 1.0),
                backgroundColor: const Color.fromRGBO(0x20, 0xba, 0xff, 1.0),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30.0), // Set the border radius
                ),
                elevation: 4.0),
            child: const Text(
              'Save changes',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            )),
        const SizedBox(height: 16.0)
      ],
    );
  }
}
