abstract class DismantleChecklistEvent {}

class LoadRelocationDetails extends DismantleChecklistEvent {}

class TakeDevicePhoto extends DismantleChecklistEvent {
  final String deviceId;
  TakeDevicePhoto(this.deviceId);
}

class VerifySerialNumber extends DismantleChecklistEvent {
  final String deviceId;
  final String serialNumber;
  VerifySerialNumber(this.deviceId, this.serialNumber);
}

class UpdateDeviceCondition extends DismantleChecklistEvent {
  final String deviceId;
  final String condition;
  UpdateDeviceCondition(this.deviceId, this.condition);
}
