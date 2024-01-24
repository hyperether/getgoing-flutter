import 'package:flutter/material.dart';

import '../utils/shared_preferences_manager.dart';

class AgePickerDialog extends StatefulWidget {
  final Function(int) onValueSelected;

  const AgePickerDialog({super.key, required this.onValueSelected});

  @override
  State<AgePickerDialog> createState() => _AgePickerDialogState();
}

class _AgePickerDialogState extends State<AgePickerDialog> {
  List<bool> selectedItems = List.generate(100, (index) => false);
  int selectedItem = -1;
  late int _age;

  @override
  void initState() {
    super.initState();
    _loadStoredValue();
  }

  _loadStoredValue() async {
    int age = await SharedPreferencesManager.getAge();
    setState(() {
      _age = age;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select an Option',
          style: TextStyle(
            color: Color.fromRGBO(0x20, 0xba, 0xff, 1.0),
          )),
      content: Container(
        height: 200.0,
        child: ListWheelScrollView(
          itemExtent: 50.0,
          children: List.generate(
              100,
              (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItem =
                            index; //selectedItems[index] = !selectedItems[index];
                      });
                    },
                    child: Container(
                      height: 50.0,
                      color: selectedItem == index
                          ? const Color.fromRGBO(0x20, 0xba, 0xff, 1.0)
                          : Colors.white,
                      alignment: Alignment.center,
                      child: Text('$index year'),
                    ),

                    // Center(
                    //   child: Text('$index year(s)'),
                    // ),
                  )),
          onSelectedItemChanged: (index) {
            setState(() {
              _age = index;
            });
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel',
              style: TextStyle(color: Color.fromRGBO(0x20, 0xba, 0xff, 1.0))),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              widget.onValueSelected(_age);
            });
            Navigator.of(context).pop();
          },
          child: const Text('Confirm',
              style: TextStyle(color: Color.fromRGBO(0x20, 0xba, 0xff, 1.0))),
        ),
      ],
    );
  }
}
