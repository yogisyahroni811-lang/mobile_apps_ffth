import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:field_technician_app/data/repositories/map_repository.dart';
import 'path_overwrite_event.dart';
import 'path_overwrite_state.dart';

class PathOverwriteBloc extends Bloc<PathOverwriteEvent, PathOverwriteState> {
  final MapRepository mapRepository;

  PathOverwriteBloc({required this.mapRepository})
      : super(PathOverwriteInitial()) {
    on<LoadPathData>(_onLoadPathData);
  }

  void _onLoadPathData(LoadPathData event, Emitter<PathOverwriteState> emit) {
    try {
      emit(PathOverwriteLoading());
      final paths = mapRepository.getMapPaths();
      emit(PathOverwriteLoaded(paths));
    } catch (e) {
      emit(PathOverwriteError(e.toString()));
    }
  }
}
