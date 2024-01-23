import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0xf0, 0xf4, 0xf7, 1.0),
        title: const Text('My profile'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'MY DATA',
                    style: TextStyle(
                        fontSize: 22.0,
                        color: const Color.fromRGBO(0x2f, 0x2f, 0x2f, 1.0)),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.male, size: 40.0),
                      Text('    Male    ')
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.cake, size: 40.0),
                      Text('21 years old ')
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.ac_unit, size: 40.0),
                      Text('  185 cm  ')
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.scale, size: 40.0),
                      Text('   85 kg  ')
                    ],
                  )
                ],
              ),
              const SizedBox(height: 60.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'TOTAL ACTIVITIES',
                    style: TextStyle(
                        fontSize: 22.0,
                        color: const Color.fromRGBO(0x2f, 0x2f, 0x2f, 1.0)),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.male, size: 40.0),
                      Text('    Male    ')
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.cake, size: 40.0),
                      Text('21 years old ')
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
