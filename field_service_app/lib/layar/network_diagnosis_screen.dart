import 'package:flutter/material.dart';
import 'package:field_service_app/data/network_diagnosis_model.dart';

class NetworkDiagnosisScreen extends StatefulWidget {
  const NetworkDiagnosisScreen({Key? key}) : super(key: key);

  @override
  _NetworkDiagnosisScreenState createState() => _NetworkDiagnosisScreenState();
}

class _NetworkDiagnosisScreenState extends State<NetworkDiagnosisScreen> {
  int _currentStep = 0;
  late List<DiagnosisStep> _steps;
  final TextEditingController _controller = TextEditingController();
  DiagnosisReading? _previousReading;

  @override
  void initState() {
    super.initState();
    _steps = [
      DiagnosisStep(
        title: 'Measure Input (Feeder)',
        description: 'Connect your optical power meter to the ODP input port (Feeder cable). Enter the measured value below.',
        thresholdNormal: -25.0,
        thresholdWeak: -27.0,
      ),
      DiagnosisStep(
        title: 'Measure Output (Port 1)',
        description: 'Connect the meter to the first active output port. Enter the measured value.',
        thresholdNormal: -25.5,
        thresholdWeak: -27.5,
      ),
      DiagnosisStep(
        title: 'Check Connectors',
        description: 'Inspect and clean all physical connectors at the ODP. Remeasure input.',
        thresholdNormal: -25.0,
        thresholdWeak: -27.0,
      ),
      DiagnosisStep(
        title: 'Final Verification',
        description: 'Confirm signal levels are stable after completing all steps.',
        thresholdNormal: -25.0,
        thresholdWeak: -27.0,
      ),
    ];
    // Simulate a previous reading and an initial critical state as per the design
    _previousReading = DiagnosisReading(value: -28.15, timestamp: DateTime.now());
    _controller.text = '-28.00';
    _updateReading();
  }

  void _updateReading() {
    final value = double.tryParse(_controller.text);
    if (value != null) {
      setState(() {
        _steps[_currentStep].reading = DiagnosisReading(value: value, timestamp: DateTime.now());
      });
    }
  }

  Color _getStatusColor(DiagnosisStatus status) {
    switch (status) {
      case DiagnosisStatus.critical:
        return Colors.red;
      case DiagnosisStatus.weak:
        return Colors.amber;
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentStep = _steps[_currentStep];
    final status = currentStep.status;
    final isDarkMode = true; // Forcing dark mode as per design
    final bgColor = isDarkMode ? const Color(0xFF101922) : const Color(0xFFF6F7F8);
    final surfaceColor = isDarkMode ? const Color(0xFF1e2832) : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: const Text('High Loss Diagnosis'),
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildStepper(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Text(currentStep.title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(currentStep.description, style: const TextStyle(color: Colors.grey, fontSize: 16)),
                const SizedBox(height: 24),
                _buildInputCard(currentStep, surfaceColor),
                const SizedBox(height: 24),
                _buildHistoryLog(surfaceColor),
              ],
            ),
          ),
          _buildFooter(status),
        ],
      ),
    );
  }

  Widget _buildStepper() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: List.generate(_steps.length, (index) {
          return Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 6,
              decoration: BoxDecoration(
                color: index <= _currentStep ? const Color(0xFF137fec) : Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildInputCard(DiagnosisStep step, Color surfaceColor) {
    final status = step.status;
    final statusColor = _getStatusColor(status);

    return Card(
      color: surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: statusColor, width: status != DiagnosisStatus.normal ? 1.5 : 0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: (value) => _updateReading(),
              keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                border: InputBorder.none,
                suffixText: 'dBm',
                suffixStyle: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ),
            const Divider(),
            if (status != DiagnosisStatus.normal)
              ListTile(
                leading: Icon(Icons.warning, color: statusColor),
                title: Text(
                  status == DiagnosisStatus.critical ? 'Signal Too Weak' : 'Signal is Weak',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  status == DiagnosisStatus.critical
                      ? 'Target range is > ${step.thresholdNormal} dBm. Potential break in feeder section.'
                      : 'Signal is below optimal range of > ${step.thresholdNormal} dBm.',
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryLog(Color surfaceColor) {
    if (_previousReading == null) return const SizedBox.shrink();
    return Card(
      color: surfaceColor,
      child: ListTile(
        leading: const Icon(Icons.history, color: Colors.grey),
        title: const Text('Previous Reading'),
        trailing: Text('${_previousReading!.value} dBm', style: const TextStyle(fontFamily: 'monospace')),
      ),
    );
  }

  Widget _buildFooter(DiagnosisStatus status) {
    bool isCritical = status == DiagnosisStatus.critical;
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: const Color(0xFF101922),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(onPressed: () {}, child: const Text('Retest')),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: isCritical ? Colors.red : const Color(0xFF137fec),
              ),
              child: Text(isCritical ? 'Escalate to Backbone' : 'Next Step'),
            ),
          ),
        ],
      ),
    );
  }
}
