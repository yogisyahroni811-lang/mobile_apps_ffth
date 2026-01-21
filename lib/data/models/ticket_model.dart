import 'package:flutter/material.dart';

enum TicketPriority {
  critical,
  high,
  normal,
}

class Ticket {
  final String id;
  final String timeAgo;
  final TicketPriority priority;
  final String title;
  final IconData icon;
  final String location;
  final String category;

  Ticket({
    required this.id,
    required this.timeAgo,
    required this.priority,
    required this.title,
    required this.icon,
    required this.location,
    required this.category,
  });
}
