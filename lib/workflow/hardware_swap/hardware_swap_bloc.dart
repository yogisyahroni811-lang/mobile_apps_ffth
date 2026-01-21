import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:field_technician_app/data/repositories/relocation_repository.dart';
import 'hardware_swap_event.dart';
import 'hardware_swap_state.dart';

class HardwareSwapBloc extends Bloc<HardwareSwapEvent, HardwareSwapState> {
  final RelocationRepository relocationRepository;

  HardwareSwapBloc({required this.relocationRepository})
      : super(HardwareSwapInitial()) {
    on<LoadDeviceDetails>(_onLoadDeviceDetails);
  }

  void _onLoadDeviceDetails(
      LoadDeviceDetails event, Emitter<HardwareSwapState> emit) {
    try {
      emit(HardwareSwapLoading());
      final relocation = relocationRepository.getRelocation();
      final device =
          relocation.devices.firstWhere((d) => d.id == event.deviceId);
      emit(HardwareSwapLoaded(device));
    } catch (e) {
      emit(HardwareSwapError(e.toString()));
    }
  }
}
