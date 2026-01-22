import 'package:field_technician_app/field_worker_app/app/modules/dashboard/dashboard_page.dart';
import 'package:field_technician_app/field_worker_app/app/modules/login/login_page.dart';
import 'package:field_technician_app/field_worker_app/app/modules/task/task_page.dart';
import 'package:flutter/material.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardPage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: Routes.TASK,
      page: () => const TaskPage(),
    ),
  ];
}

class GetPage extends Page {
  final String name;
  final Widget Function() page;

  GetPage({required this.name, required this.page});

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => page(),
    );
  }
}
