import 'package:field_service_app/data/odp_audit_model.dart';

class OdpAuditWorkflow {
  OdpAudit? audit;

  void loadAudit(String auditId) {
    // Simulate fetching audit data
    audit = OdpAudit(
      id: auditId,
      region: 'South Jakarta Region',
      utilizedPorts: 7,
      totalPorts: 8,
      portValidations: [
        PortValidation(portNumber: 1, customerName: 'Bpk. Budi Santoso', status: PortStatus.match),
        PortValidation(portNumber: 2, customerName: 'Available / Empty', status: PortStatus.ghost),
        PortValidation(portNumber: 3, customerName: 'Ibu Susi W.', status: PortStatus.mismatch),
        PortValidation(portNumber: 4, customerName: 'CV. Maju Jaya', status: PortStatus.match),
        PortValidation(portNumber: 5, customerName: 'Bpk. Agung', status: PortStatus.match),
      ],
    );
  }

  void updatePortStatus(int portNumber, PortStatus newStatus, {String? actualTagId}) {
    if (audit == null) return;
    final portIndex = audit!.portValidations.indexWhere((p) => p.portNumber == portNumber);
    if (portIndex != -1) {
      // In a real app with a proper state management solution, you would
      // create a new object instead of mutating the existing one.
      // audit!.portValidations[portIndex].status = newStatus;
      // audit!.portValidations[portIndex].actualTagId = actualTagId;
      print('Port $portNumber status updated to $newStatus');
    }
  }

  Future<void> submitAudit() async {
    if (audit == null) {
      print('No audit data to submit.');
      return;
    }
    // Simulate submitting the audit data
    print('Submitting audit for ${audit!.id}...');
    await Future.delayed(const Duration(seconds: 2));
    print('Audit submitted successfully.');
  }
}
