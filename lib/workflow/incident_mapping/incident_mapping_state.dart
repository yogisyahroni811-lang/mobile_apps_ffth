import 'package:field_technician_app/data/models/map_marker.dart';
import 'package:field_technician_app/data/models/map_path.dart';

abstract class IncidentMappingState {}

class IncidentMappingInitial extends IncidentMappingState {}

class IncidentMappingLoading extends IncidentMappingState {}

class IncidentMappingLoaded extends IncidentMappingState {
  final List<MapMarker> markers;
  final List<MapPath> paths;
  IncidentMappingLoaded(this.markers, this.paths);
}

class IncidentMappingError extends IncidentMappingState {
  final String message;
  IncidentMappingError(this.message);
}
