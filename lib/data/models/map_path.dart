import 'package:flutter/material.dart';

class MapPath {
  final String id;
  final List<Offset> points;
  final Color color;
  final bool isDashed;

  MapPath({
    required this.id,
    required this.points,
    required this.color,
    this.isDashed = false,
  });
}
