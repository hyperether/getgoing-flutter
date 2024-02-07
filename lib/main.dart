import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getgoing_flutter/data/cubit/route_cubit.dart';
import 'package:getgoing_flutter/data/providers/route_provider.dart';
import 'package:getgoing_flutter/screens/get_going_main.dart';
import 'package:getgoing_flutter/screens/my_activities.dart';
import 'package:getgoing_flutter/screens/profile_screen.dart';
import 'package:getgoing_flutter/screens/show_data_screen.dart';
import 'package:getgoing_flutter/screens/tracking_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<RouteProvider>(
              create: (context) => RouteProvider()),
          BlocProvider(create: (_) => RouteCubit())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/home',
            routes: {
              '/home': (context) => const GetGoingMain(),
              '/activities': (context) => const MyActivities(),
              '/tracking': (context) => const TrackingScreen(),
              '/profile': (context) => const ProfileScreen(),
              '/showData': (context) => const ShowDataScreen()
            }),
      ),
    );
