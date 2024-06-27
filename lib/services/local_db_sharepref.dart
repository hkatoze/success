import 'package:shared_preferences/shared_preferences.dart';
import 'package:success/models/user.dart';

Future<User?> getLoggedUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userData = prefs.getString('user');

  if (userData != null) {
    return User.fromJson(userData);
  } else {
    return null;
  }
}

Future<void> addUser(User user) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('user', "${user.toJson()}");
}

Future<void> updateUser(User user) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('user', "${user.toJson()}");
}

Future<void> deleteUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('user');
}

Future<void> clearPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
