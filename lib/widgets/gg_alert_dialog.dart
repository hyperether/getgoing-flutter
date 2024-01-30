import 'package:flutter/material.dart';
import 'package:getgoing_flutter/domain/repository/shared_preferences_manager.dart';

class GGAlertDialog extends StatefulWidget {
  final Function(int) callback;

  const GGAlertDialog({required this.callback, super.key});

  @override
  State<GGAlertDialog> createState() => _GGAlertDialogState();
}

class _GGAlertDialogState extends State<GGAlertDialog> {
  int _editedValue = 0;

  @override
  void initState() {
    super.initState();
    _getGoal();
  }

  _getGoal() async {
    int goal = await SharedPreferencesManager.getGoal();
    setState(() {
      _editedValue = goal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Incorrect value',
          style: TextStyle(
            color: Color.fromRGBO(0x20, 0xba, 0xff, 1.0),
          )),
      content: const SizedBox(
        child: Text('Goal cannot be 0',
            style: TextStyle(
              color: Color.fromRGBO(0x47, 0x47, 0x47, 1.0),
            )),
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
              widget.callback(_editedValue);
            });
            Navigator.of(context).pop();
          },
          child: const Text('OK',
              style: TextStyle(color: Color.fromRGBO(0x20, 0xba, 0xff, 1.0))),
        ),
      ],
    );
  }
}
