abstract class HardwareSwapEvent {}

class LoadDeviceDetails extends HardwareSwapEvent {
  final String deviceId;
  LoadDeviceDetails(this.deviceId);
}

class ScanNewDevice extends HardwareSwapEvent {
  final String serialNumber;
  ScanNewDevice(this.serialNumber);
}

class ConfirmSwap extends HardwareSwapEvent {}
