import 'package:field_service_app/data/network_diagnosis_model.dart';

class NetworkDiagnosisWorkflow {
  List<DiagnosisStep> steps = [];
  int currentStepIndex = 0;

  NetworkDiagnosisWorkflow() {
    _initializeSteps();
  }

  DiagnosisStep get currentStep => steps[currentStepIndex];

  void _initializeSteps() {
    steps = [
      DiagnosisStep(
        title: 'Measure Input (Feeder)',
        description: 'Connect your optical power meter to the ODP input port...',
        thresholdNormal: -25.0,
        thresholdWeak: -27.0,
      ),
      DiagnosisStep(
        title: 'Measure Output (Port 1)',
        description: 'Connect the meter to the first active output port...',
        thresholdNormal: -25.5,
        thresholdWeak: -27.5,
      ),
      // ... more steps
    ];
  }

  void recordReading(double value) {
    currentStep.reading = DiagnosisReading(value: value, timestamp: DateTime.now());
    print('Recorded reading for step "${currentStep.title}": $value dBm');
  }

  bool nextStep() {
    if (currentStepIndex < steps.length - 1) {
      currentStepIndex++;
      return true;
    }
    return false; // End of diagnosis
  }

  void reset() {
    currentStepIndex = 0;
    for (var step in steps) {
      step.reading = null;
    }
  }

  Future<void> escalate() async {
    final step = currentStep;
    print('Escalating issue at step: "${step.title}" with reading: ${step.reading?.value} dBm');
    // Simulate escalation logic, e.g., creating a trouble ticket
    await Future.delayed(const Duration(seconds: 2));
    print('Escalation ticket created successfully.');
  }
}
