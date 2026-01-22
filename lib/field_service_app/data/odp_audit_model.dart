enum PortStatus { match, ghost, mismatch }

class PortValidation {
  final int portNumber;
  final String customerName;
  final PortStatus status;
  final String? actualTagId; // Used for mismatch

  PortValidation({
    required this.portNumber,
    required this.customerName,
    this.status = PortStatus.match,
    this.actualTagId,
  });
}

class OdpAudit {
  final String id;
  final String region;
  final int utilizedPorts;
  final int totalPorts;
  final List<PortValidation> portValidations;

  OdpAudit({
    required this.id,
    required this.region,
    required this.utilizedPorts,
    required this.totalPorts,
    required this.portValidations,
  });

  double get utilization => utilizedPorts / totalPorts;
}
