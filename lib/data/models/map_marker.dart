import 'package:flutter/material.dart';

class MapMarker {
  final String id;
  final Offset position;
  final String label;
  final IconData icon;

  MapMarker({
    required this.id,
    required this.position,
    required this.label,
    required this.icon,
  });
}
