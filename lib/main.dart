import 'package:flutter/material.dart';
import 'package:getgoing_flutter/screens/get_going_main.dart';
import 'package:getgoing_flutter/screens/my_activities.dart';
import 'package:getgoing_flutter/screens/profile_screen.dart';
import 'package:getgoing_flutter/screens/tracking_screen.dart';

void main() => runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (context) => const GetGoingMain(),
          '/activities': (context) => const MyActivities(),
          '/tracking': (context) => const TrackingScreen(),
          '/profile': (context) => const ProfileScreen(),
        }));
