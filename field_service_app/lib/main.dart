import 'package:flutter/material.dart';
import 'package:field_service_app/layar/asset_migration_screen.dart';
import 'package:field_service_app/layar/home_screen.dart';
import 'package:field_service_app/layar/network_diagnosis_screen.dart';
import 'package:field_service_app/layar/odp_audit_screen.dart';
import 'package:field_service_app/layar/odp_bulk_swap_screen.dart';
import 'package:field_service_app/layar/splicing_matrix_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Field Service App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/asset_migration': (context) => const AssetMigrationScreen(),
        '/odp_audit': (context) => const OdpAuditScreen(),
        '/splicing_matrix': (context) => const SplicingMatrixScreen(),
        '/odp_bulk_swap': (context) => const OdpBulkSwapScreen(),
        '/network_diagnosis': (context) => const NetworkDiagnosisScreen(),
      },
    );
  }
}
