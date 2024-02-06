import 'package:flutter/material.dart';
import 'package:getgoing_flutter/providers/route_provider.dart';
import 'package:getgoing_flutter/screens/get_going_main.dart';
import 'package:getgoing_flutter/screens/my_activities.dart';
import 'package:getgoing_flutter/screens/profile_screen.dart';
import 'package:getgoing_flutter/screens/show_data_screen.dart';
import 'package:getgoing_flutter/screens/tracking_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider<RouteProvider>(
        create: (context) => RouteProvider(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/home',
            routes: {
              '/home': (context) => const GetGoingMain(),
              '/activities': (context) => const MyActivities(),
              '/tracking': (context) => const TrackingScreen(),
              '/profile': (context) => const ProfileScreen(),
              '/showData': (context) {
                final args =
                    ModalRoute.of(context)!.settings.arguments as String;
                return ShowDataScreen(data: args);
              },
            }),
      ),
    );
