enum PortStatus { active, faulty, empty }

class Port {
  final String id;
  final PortStatus status;
  String? mappedToPortId; // Represents the ID of the port it's connected to in the other device

  Port({
    required this.id,
    required this.status,
    this.mappedToPortId,
  });
}

class OdpDevice {
  final String id;
  final List<Port> ports;

  OdpDevice({required this.id, required this.ports});
}
