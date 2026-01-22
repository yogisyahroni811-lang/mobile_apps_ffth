import 'package:flutter/material.dart';
import 'package:field_technician_app/field_worker_app/app/utils/theme/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    fontFamily: 'Inter',
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    cardColor: AppColors.cardDark,
    dividerColor: AppColors.surfaceDark,
    fontFamily: 'Inter',
  );
}
