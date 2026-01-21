class Relocation {
  final String id;
  final String customerName;
  final String address;
  final List<Device> devices;

  Relocation({
    required this.id,
    required this.customerName,
    required this.address,
    required this.devices,
  });
}

class Device {
  final String id;
  final String name;
  final String description;
  String? serialNumber;
  DeviceCondition condition;
  String? photoPath;
  DeviceStatus status;

  Device({
    required this.id,
    required this.name,
    required this.description,
    this.serialNumber,
    this.condition = DeviceCondition.good,
    this.photoPath,
    this.status = DeviceStatus.pending,
  });
}

enum DeviceCondition {
  good,
  minorScratches,
  damaged,
  missing,
}

enum DeviceStatus {
  pending,
  verified,
}
