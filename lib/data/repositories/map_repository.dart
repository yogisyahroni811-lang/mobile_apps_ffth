import '../providers/mock_data_provider.dart';
import '../models/map_marker.dart';
import '../models/map_path.dart';

class MapRepository {
  final MockDataProvider _dataProvider;

  MapRepository({MockDataProvider? dataProvider})
      : _dataProvider = dataProvider ?? MockDataProvider();

  List<MapMarker> getMapMarkers() {
    return _dataProvider.getMapMarkers();
  }

  List<MapPath> getMapPaths() {
    return _dataProvider.getMapPaths();
  }
}
