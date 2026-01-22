enum DiagnosisStatus { normal, weak, critical }

class DiagnosisReading {
  final double value;
  final DateTime timestamp;

  DiagnosisReading({required this.value, required this.timestamp});
}

class DiagnosisStep {
  final String title;
  final String description;
  final double thresholdNormal; // e.g., > -25 dBm
  final double thresholdWeak;   // e.g., > -27 dBm
  DiagnosisReading? reading;

  DiagnosisStep({
    required this.title,
    required this.description,
    required this.thresholdNormal,
    required this.thresholdWeak,
    this.reading,
  });

  DiagnosisStatus get status {
    if (reading == null) return DiagnosisStatus.normal; // Default state before reading
    if (reading!.value > thresholdNormal) return DiagnosisStatus.normal;
    if (reading!.value > thresholdWeak) return DiagnosisStatus.weak;
    return DiagnosisStatus.critical;
  }
}
