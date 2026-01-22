import 'package:field_technician_app/field_service_app/data/splicing_matrix_model.dart';

class SplicingMatrixWorkflow {
  FiberCable? cableA;
  FiberCable? cableB;
  List<SpliceConnection> connections = [];

  void loadCables(String cableAId, String cableBId) {
    // Simulate loading cable data
    _generateMockData();
  }

  void createConnection(int fromCoreId, int toCoreId) {
    connections.add(SpliceConnection(fromCoreId: fromCoreId, toCoreId: toCoreId));
    print('Created connection from $fromCoreId to $toCoreId');
  }

  void removeConnection(int fromCoreId, int toCoreId) {
    connections.removeWhere((c) => c.fromCoreId == fromCoreId && c.toCoreId == toCoreId);
    print('Removed connection from $fromCoreId to $toCoreId');
  }

  Future<void> saveMatrix() async {
    print('Saving splicing matrix...');
    await Future.delayed(const Duration(seconds: 1));
    print('Matrix saved.');
  }

  void _generateMockData() {
    var tube1CoresA = List.generate(6, (i) => FiberCore(id: i + 1, color: FiberColor.values[i], name: FiberColor.values[i].toString().split('.').last));
    var tube2CoresA = List.generate(6, (i) => FiberCore(id: i + 7, color: FiberColor.values[i], name: FiberColor.values[i].toString().split('.').last));
    cableA = FiberCable(id: 'CABLE-A', name: 'Kabel A', location: 'POP A', tubes: [
      FiberTube(id: 1, color: FiberColor.blue, cores: tube1CoresA),
      FiberTube(id: 2, color: FiberColor.orange, cores: tube2CoresA),
    ]);

    var tube1CoresB = List.generate(6, (i) => FiberCore(id: i + 101, color: FiberColor.values[i], name: FiberColor.values[i].toString().split('.').last));
    var tube2CoresB = List.generate(6, (i) => FiberCore(id: i + 107, color: FiberColor.values[i], name: FiberColor.values[i].toString().split('.').last));
    cableB = FiberCable(id: 'CABLE-B', name: 'Kabel B', location: 'ODP B', tubes: [
      FiberTube(id: 1, color: FiberColor.blue, cores: tube1CoresB),
      FiberTube(id: 2, color: FiberColor.orange, cores: tube2CoresB),
    ]);

    connections = [
      SpliceConnection(fromCoreId: 1, toCoreId: 101),
      SpliceConnection(fromCoreId: 2, toCoreId: 102),
    ];
  }
}
