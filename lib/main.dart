import 'package:flutter/material.dart';
import 'package:field_technician_app/layar/new_ticket/new_ticket_screen.dart';
import 'screens/work_completion_report/work_completion_report_screen.dart';
import 'screens/field_diagnosis/field_diagnosis_screen.dart';
import 'screens/olt_hardware_swap/olt_hardware_swap_screen.dart';
import 'screens/backbone_pop_diagnostic/backbone_pop_diagnostic_screen.dart';
import 'screens/smart_ticket/smart_ticket_screen.dart';
import 'screens/otdr_locator/otdr_locator_screen.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Field Technician App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Field Technician App'),
      ),
      body: ListView(
        children: [
          _buildScreenButton(context, 'New Ticket (Wizard)', const NewTicketScreen()),
          _buildScreenButton(context, 'Work Completion Report', const WorkCompletionReportScreen()),
          _buildScreenButton(context, 'Field Diagnosis', const FieldDiagnosisScreen()),
          _buildScreenButton(context, 'OLT Hardware Swap', const OltHardwareSwapScreen()),
          _buildScreenButton(context, 'Backbone POP Diagnostic', const BackbonePopDiagnosticScreen()),
          _buildScreenButton(context, 'Smart Ticket', const SmartTicketScreen()),
          _buildScreenButton(context, 'OTDR Locator', const OtdrLocatorScreen()),
        ],
      ),
    );
  }

  Widget _buildScreenButton(BuildContext context, String title, Widget screen) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}
