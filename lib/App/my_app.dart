import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphic_app/App/UI/Auth/login_screen.dart';
import 'package:graphic_app/App/UI/Screens/home_screen.dart';
import 'package:graphic_app/App/Utils/Theme/app_theme.dart';
import 'Bindings/app_binding.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Graphic App',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      home: email != null || email == '' ? HomePage(): LogInScreen(),
    );
  }
}