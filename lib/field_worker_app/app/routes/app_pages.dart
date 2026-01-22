import 'package:field_technician_app/field_worker_app/app/modules/dashboard/dashboard_page.dart';
import 'package:field_technician_app/field_worker_app/app/modules/login/login_page.dart';
import 'package:field_technician_app/field_worker_app/app/modules/task/task_page.dart';
import 'package:get/get.dart';

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
