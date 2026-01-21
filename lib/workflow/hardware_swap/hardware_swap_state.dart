import 'package:field_technician_app/data/models/relocation.dart';

abstract class HardwareSwapState {}

class HardwareSwapInitial extends HardwareSwapState {}

class HardwareSwapLoading extends HardwareSwapState {}

class HardwareSwapLoaded extends HardwareSwapState {
  final Device oldDevice;
  final Device? newDevice;
  HardwareSwapLoaded(this.oldDevice, {this.newDevice});
}

class HardwareSwapError extends HardwareSwapState {
  final String message;
  HardwareSwapError(this.message);
}

class HardwareSwapSuccess extends HardwareSwapState {}
