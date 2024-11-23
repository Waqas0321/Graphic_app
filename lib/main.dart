import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'App/my_app.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check for email in SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final String? email = prefs.getString('user_email');
  runApp(MyApp(email: email,));
}
