import 'package:field_technician_app/data/models/map_path.dart';

abstract class PathOverwriteState {}

class PathOverwriteInitial extends PathOverwriteState {}

class PathOverwriteLoading extends PathOverwriteState {}

class PathOverwriteLoaded extends PathOverwriteState {
  final List<MapPath> paths;
  PathOverwriteLoaded(this.paths);
}

class PathOverwriteError extends PathOverwriteState {
  final String message;
  PathOverwriteError(this.message);
}
