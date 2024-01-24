import 'package:flutter/material.dart';
import 'package:getgoing_flutter/domain/models/gender.dart';
import '../utils/shared_preferences_manager.dart';

class GenderDialog extends StatefulWidget {
  final Function(Gender) onValueSelected;

  const GenderDialog({super.key, required this.onValueSelected});

  @override
  State<GenderDialog> createState() => _GenderDialogDialogState();
}

class _GenderDialogDialogState extends State<GenderDialog> {
  late Gender _storedGender;
  int genderNumber = 0;

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
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          const Text('Please select your gender:',
              style: TextStyle(
                  color: Color.fromRGBO(0x20, 0xba, 0xff, 1.0),
                  fontSize: 18.0)),
          RadioListTile<Gender>(
            title: const Text('Male'),
            value: Gender.male,
            groupValue: _storedGender,
            onChanged: (Gender? value) {
              setState(() {
                _storedGender = value!;
              });
            },
          ),
          RadioListTile<Gender>(
            title: const Text('Female'),
            value: Gender.female,
            groupValue: _storedGender,
            onChanged: (Gender? value) {
              setState(() {
                _storedGender = value!;
              });
            },
          ),
          RadioListTile<Gender>(
            title: const Text('Other'),
            value: Gender.other,
            groupValue: _storedGender,
            onChanged: (Gender? value) {
              setState(() {
                _storedGender = value!;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Cancel',
                    style: TextStyle(
                        color: Color.fromRGBO(0x20, 0xba, 0xff, 1.0))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('Confirm',
                    style: TextStyle(
                        color: Color.fromRGBO(0x20, 0xba, 0xff, 1.0))),
                onPressed: () {
                  setState(() {
                    widget.onValueSelected(_storedGender);
                  });
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ]),
      ),
    );
  }
}
