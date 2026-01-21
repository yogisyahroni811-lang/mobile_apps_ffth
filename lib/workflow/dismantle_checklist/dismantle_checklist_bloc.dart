import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:field_technician_app/data/repositories/relocation_repository.dart';
import 'dismantle_checklist_event.dart';
import 'dismantle_checklist_state.dart';

class DismantleChecklistBloc
    extends Bloc<DismantleChecklistEvent, DismantleChecklistState> {
  final RelocationRepository relocationRepository;

  DismantleChecklistBloc({required this.relocationRepository})
      : super(DismantleChecklistInitial()) {
    on<LoadRelocationDetails>(_onLoadRelocationDetails);
  }

  void _onLoadRelocationDetails(
      LoadRelocationDetails event, Emitter<DismantleChecklistState> emit) {
    try {
      emit(DismantleChecklistLoading());
      final relocation = relocationRepository.getRelocation();
      emit(DismantleChecklistLoaded(relocation));
    } catch (e) {
      emit(DismantleChecklistError(e.toString()));
    }
  }
}
