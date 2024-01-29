import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  GoogleMapController? mapController;
  LatLng? myLocation;
  bool _isCameraMoving = false;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    // Start a timer to update the location every 5 seconds
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      _moveToCurrentLocation();
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _moveToCurrentLocation();
  }

  void _moveToCurrentLocation() {
    if (mapController != null && myLocation != null) {
      mapController?.animateCamera(CameraUpdate.newLatLngZoom(myLocation!, 14));
    }
  }

  Future<void> getCurrentLocation() async {
    var status = await Permission.location.status;
    if (status != PermissionStatus.granted) {
      status = await Permission.location.request();
      if (status != PermissionStatus.granted) {
        // Handle the case where the user denied location permission.
        return;
      }
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        myLocation = LatLng(position.latitude, position.longitude);
      });
      _moveToCurrentLocation();
    } catch (e) {
      print('Error obtaining current location: $e');
    }
  }

  void _updateLocation(LatLng newLocation) {
    setState(() {
      myLocation = newLocation;
    });
    _moveToCurrentLocation();
    print('New Location: $newLocation');
  }

  @override
  Widget build(BuildContext context) {
    double parentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0xf0, 0xf4, 0xf7, 1.0),
        title: const Text('Walking'),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: const CameraPosition(
              target: LatLng(44.787197, 20.457273),
              zoom: 11.0,
            ),
            onCameraMove: (CameraPosition position) {
              //_updateLocation(position.target);
            },
            onCameraMoveStarted: () {
              setState(() {
                //_isCameraMoving = true;
              });
            },
            onCameraIdle: () {
              setState(() {
                //_isCameraMoving = false;
              });
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: const Color.fromRGBO(0xff, 0xfe, 0xff, 1.0),
                height: 140,
                child: const Center(
                  child: Text(
                    'Set goal for this exercise',
                    style: TextStyle(
                        color: Color.fromRGBO(0x20, 0xba, 0xff, 1.0),
                        fontSize: 22.0),
                  ),
                ),
              )
            ],
          ),
          // Positioned(
          //     left: (parentWidth - 160.0) / 2,
          //     bottom: 100,
          //     child: Center(
          //       child: ClipOval(
          //         child: Container(
          //           color: const Color.fromRGBO(0xf0, 0xf4, 0xf7, 1.0),
          //           width: 160.0,
          //           height: 160.0,
          //         ),
          //       ),
          //     )),
          Positioned(
            left: (parentWidth - 120.0) / 2,
            // Adjust the width of the child accordingly
            bottom: 140.0,
            child: ClipOval(
                child: Container(
              color: const Color.fromRGBO(0xff, 0xff, 0xff, 0.8),
              width: 120.0,
              height: 120.0,
              child: Center(
                child: ClipOval(
                  child: Container(
                      color: const Color.fromRGBO(0xff, 0xfe, 0xff, 1.0),
                      width: 100.0,
                      height: 100.0,
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: Color.fromRGBO(0x20, 0xba, 0xff, 1.0),
                        size: 100.0,
                      )),
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }
}
