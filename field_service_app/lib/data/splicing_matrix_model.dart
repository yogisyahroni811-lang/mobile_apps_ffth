// Enum for fiber colors
enum FiberColor {
  blue, orange, green, brown, slate, white, red, black, yellow, violet, rose, aqua
}

// Data model for a single fiber core
class FiberCore {
  final int id;
  final FiberColor color;
  final String name;

  FiberCore({required this.id, required this.color, required this.name});
}

// Data model for a tube containing cores
class FiberTube {
  final int id;
  final FiberColor color;
  final List<FiberCore> cores;

  FiberTube({required this.id, required this.color, required this.cores});
}

// Data model for a cable containing tubes
class FiberCable {
  final String id;
  final String name;
  final String location;
  final List<FiberTube> tubes;

  FiberCable({required this.id, required this.name, required this.location, required this.tubes});
}

// Data model for a connection between two cores
class SpliceConnection {
  final int fromCoreId;
  final int toCoreId;

  SpliceConnection({required this.fromCoreId, required this.toCoreId});
}
