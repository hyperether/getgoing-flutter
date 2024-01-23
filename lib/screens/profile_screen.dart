import 'package:flutter/material.dart';
import '../utils/shared_preferences_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _controllerGender = TextEditingController();
  int _storedGender = 0;

  @override
  void initState() {
    super.initState();
    _loadStoredValue();
  }

  _loadStoredValue() async {
    int gender = await SharedPreferencesManager.getGender();
    setState(() {
      _storedGender = gender;
    });
  }

  _saveValue() async {
    await SharedPreferencesManager.setGender(int.parse(_controllerGender.text));
    _loadStoredValue();
  }

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
              TextField(
                controller: _controllerGender,
                decoration: InputDecoration(labelText: 'Enter a value 0/1/2:'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveValue,
                child: Text('Save to SharedPreferences'),
              ),
              SizedBox(height: 16.0),
              Text('Stored Value: $_storedGender'),
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
                      if (_storedGender == 0)
                        Icon(Icons.male, size: 40.0)
                      else if (_storedGender == 1)
                        Icon(Icons.female, size: 40.0)
                      else if (_storedGender == 2)
                        Icon(Icons.transgender, size: 40.0),
                      if (_storedGender == 0)
                        Text('    Male    ')
                      else if (_storedGender == 1)
                        Text('    Female    ')
                      else if (_storedGender == 2)
                        Text('    Trans     ')
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
