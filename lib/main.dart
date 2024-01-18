import 'package:flutter/material.dart';
import 'package:getgoing_flutter/screens/get_going_main.dart';
import 'package:getgoing_flutter/screens/my_activities.dart';

void main() => runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (context) => const GetGoingMain(),
          '/activities': (context) => const MyActivities(),
        }));
