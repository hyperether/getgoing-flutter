import 'package:flutter/material.dart';
import 'package:getgoing_flutter/widgets/age_picker_dialog.dart';
import 'package:getgoing_flutter/widgets/gender_dialog.dart';
import '../domain/models/gender.dart';
import '../domain/repository/shared_preferences_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Gender _storedGender = Gender.male;
  int _age = 0;

  @override
  void initState() {
    super.initState();
    _loadStoredValue();
  }

  _loadStoredValue() async {
    int gender = await SharedPreferencesManager.getGender();
    setState(() {
      if (gender == 0) {
        _storedGender = Gender.male;
      } else if (gender == 1) {
        _storedGender = Gender.female;
      } else if (gender == 2) {
        _storedGender = Gender.other;
      }
    });

    int age = await SharedPreferencesManager.getAge();
    setState(() {
      _age = age;
    });
  }

  Future<void> _showGenderDialog(BuildContext context, Gender gender) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return GenderDialog(
          onValueSelected: (gender) {
            setState(() {
              _storedGender = gender;
            });
          },
        );
      },
    );
  }

  Future<void> _showAgePickerDialog(BuildContext context, int age) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AgePickerDialog(
          onValueSelected: (age) {
            setState(() {
              _age = age;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0xf0, 0xf4, 0xf7, 1.0),
        title: const Text('My profile'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 8.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'MY DATA',
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Color.fromRGBO(0x2f, 0x2f, 0x2f, 1.0)),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      _showGenderDialog(context, _storedGender);
                    },
                    child: Column(
                      children: [
                        if (_storedGender == Gender.male)
                          const Icon(Icons.male, size: 40.0)
                        else if (_storedGender == Gender.female)
                          const Icon(Icons.female, size: 40.0)
                        else if (_storedGender == Gender.other)
                          const Icon(Icons.transgender, size: 40.0),
                        if (_storedGender == Gender.male)
                          const Text('    Male    ')
                        else if (_storedGender == Gender.female)
                          const Text('    Female    ')
                        else if (_storedGender == Gender.other)
                          const Text('    Other     ')
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _showAgePickerDialog(context, 5);
                    },
                    child: Column(
                      children: [
                        const Icon(Icons.cake, size: 40.0),
                        Row(children: [
                          Text('$_age'),
                          const SizedBox(width: 4.0),
                          const Text('years')
                        ])
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.ac_unit, size: 40.0),
                      Text('  185 cm  ')
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.scale, size: 40.0),
                      Text('   85 kg  ')
                    ],
                  )
                ],
              ),
              const SizedBox(height: 60.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'TOTAL ACTIVITIES',
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Color.fromRGBO(0x2f, 0x2f, 0x2f, 1.0)),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.male, size: 40.0),
                      Text('    Male    ')
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.cake, size: 40.0),
                      Text('21 years old ')
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
