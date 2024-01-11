import 'package:flutter/material.dart';

class GetGoingMain extends StatefulWidget {
  const GetGoingMain({super.key});

  @override
  State<GetGoingMain> createState() => _GetGoingMainState();
}

class _GetGoingMainState extends State<GetGoingMain> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: const Text('Hello World'),
      ),
    );
  }
}


