import '../providers/mock_data_provider.dart';
import '../models/relocation.dart';

class RelocationRepository {
  final MockDataProvider _dataProvider;

  RelocationRepository({MockDataProvider? dataProvider})
      : _dataProvider = dataProvider ?? MockDataProvider();

  Relocation getRelocation() {
    return _dataProvider.getRelocation();
  }
}
