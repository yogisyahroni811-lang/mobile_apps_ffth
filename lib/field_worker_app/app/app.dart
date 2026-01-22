import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:field_technician_app/field_worker_app/app/routes/app_pages.dart';
import 'package:field_technician_app/field_worker_app/app/utils/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Field Worker App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
