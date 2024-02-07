import 'package:flutter/material.dart';
import '../data/repository/shared_preferences_manager.dart';

class NoRoutesDialog extends StatelessWidget {
  final int activityId;

  const NoRoutesDialog({super.key, required this.activityId});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text('No routes to display'),
      actions: [
        TextButton(
          onPressed: () {
            switch (activityId) {
              case 0:
              case 1:
              case 2:
                SharedPreferencesManager.setWalkRouteExisting(false);
                break;
            }
            Navigator.of(context).popAndPushNamed('/activities');
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
