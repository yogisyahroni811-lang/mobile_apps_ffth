class Installation {
  final String cableLength;
  final String deviceType;
  final List<MappedPoint> mappedPoints;

  Installation({
    required this.cableLength,
    required this.deviceType,
    required this.mappedPoints,
  });
}

class MappedPoint {
  final String title;
  final String timestamp;
  final String coordinates;
  final String? imageUrl;

  MappedPoint({
    required this.title,
    required this.timestamp,
    required this.coordinates,
    this.imageUrl,
  });
}
