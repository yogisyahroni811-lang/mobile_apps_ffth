import 'package:field_service_app/data/odp_bulk_swap_model.dart';

class OdpBulkSwapWorkflow {
  OdpDevice? oldDevice;
  OdpDevice? newDevice;

  void loadDevices(String oldDeviceId, String newDeviceId) {
    _generateMockData(oldDeviceId, newDeviceId);
  }

  void mapPort(String fromPortId, String toPortId) {
    if (oldDevice == null) return;
    final port = oldDevice!.ports.firstWhere((p) => p.id == fromPortId, orElse: () => Port(id: 'invalid', status: PortStatus.empty));
    if (port.id != 'invalid') {
      port.mappedToPortId = toPortId;
      print('Mapped port $fromPortId to $toPortId');
    }
  }

  Future<void> executeSwap() async {
    if (oldDevice == null || newDevice == null) {
      print('Devices not loaded.');
      return;
    }
    print('Executing swap from ${oldDevice!.id} to ${newDevice!.id}...');
    // Here you would typically post the mapping data to a backend service
    await Future.delayed(const Duration(seconds: 2));
    print('Swap executed successfully.');
  }

  void _generateMockData(String oldDeviceId, String newDeviceId) {
    oldDevice = OdpDevice(
      id: oldDeviceId,
      ports: List.generate(8, (i) {
        String id = 'P-${i + 1}';
        PortStatus status = i == 3 ? PortStatus.faulty : (i > 5 ? PortStatus.empty : PortStatus.active);
        return Port(id: id, status: status, mappedToPortId: status == PortStatus.active ? id : null);
      }),
    );

    // Override some mappings for demonstration
    oldDevice!.ports.firstWhere((p) => p.id == 'P-3').mappedToPortId = 'P-5';
    oldDevice!.ports.firstWhere((p) => p.id == 'P-5').mappedToPortId = 'P-3';

    newDevice = OdpDevice(
      id: newDeviceId,
      ports: List.generate(8, (i) => Port(id: 'P-${i + 1}', status: PortStatus.empty)),
    );
  }
}
