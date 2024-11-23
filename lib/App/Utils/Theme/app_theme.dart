import 'package:flutter/material.dart';
import 'package:graphic_app/App/Utils/Const/aap_colors.dart';
import 'Custom/text_theme.dart';

class AppTheme{
  static ThemeData get lightTheme{
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.white,
      textTheme: AppTextTheme.textTheme,
    );
  }
}