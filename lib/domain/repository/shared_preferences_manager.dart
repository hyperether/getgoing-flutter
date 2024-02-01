import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static const String _key = 'myKey';
  static const String _gender = 'gender';
  static const String _age = 'age';
  static const String _goal = 'goal';
  static const String _weight = 'weight';
  static const String _walkRouteExist = 'walkRouteExist';

  static Future<void> saveValue(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, value);
  }

  static Future<String> loadValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key) ?? '';
  }

  static Future<void> setGender(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_gender, value);
  }

  static Future<int> getGender() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_gender) ?? 0;
  }

  static Future<void> setAge(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_age, value);
  }

  static Future<int> getAge() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_age) ?? 0;
  }

  static Future<void> setGoal(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_goal, value);
  }

  static Future<int> getGoal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_goal) ?? 5000;
  }

  static Future<void> setWight(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_weight, value);
  }

  static Future<int> getWeight() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_weight) ?? 80;
  }

  static Future<void> setWalkRouteExisting(bool walk) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_walkRouteExist, walk);
  }

  static Future<bool> doesWalkRouteExist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_walkRouteExist) ?? false;
  }
}
