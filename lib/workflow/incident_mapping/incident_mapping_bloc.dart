import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:field_technician_app/data/repositories/map_repository.dart';
import 'incident_mapping_event.dart';
import 'incident_mapping_state.dart';

class IncidentMappingBloc
    extends Bloc<IncidentMappingEvent, IncidentMappingState> {
  final MapRepository mapRepository;

  IncidentMappingBloc({required this.mapRepository})
      : super(IncidentMappingInitial()) {
    on<LoadMapData>(_onLoadMapData);
  }

  void _onLoadMapData(
      LoadMapData event, Emitter<IncidentMappingState> emit) {
    try {
      emit(IncidentMappingLoading());
      final markers = mapRepository.getMapMarkers();
      final paths = mapRepository.getMapPaths();
      emit(IncidentMappingLoaded(markers, paths));
    } catch (e) {
      emit(IncidentMappingError(e.toString()));
    }
  }
}
