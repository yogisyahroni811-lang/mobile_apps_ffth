abstract class PathOverwriteEvent {}

class LoadPathData extends PathOverwriteEvent {}

class AddPathPoint extends PathOverwriteEvent {
  // final LatLng position;
  // AddPathPoint(this.position);
}

class SaveNewPath extends PathOverwriteEvent {}
