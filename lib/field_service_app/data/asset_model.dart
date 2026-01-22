class Asset {
  final String id;
  final String address;
  final int impactedCustomers;
  final double migrationDistance;

  Asset({
    required this.id,
    required this.address,
    required this.impactedCustomers,
    required this.migrationDistance,
  });
}
