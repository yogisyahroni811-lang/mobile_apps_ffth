import 'package:flutter/material.dart';
import '../models/ticket_model.dart';

class TicketRepository {
  List<Ticket> getTickets() {
    return [
      Ticket(
        id: '#TKT-4029',
        timeAgo: '10m ago',
        priority: TicketPriority.critical,
        title: 'Fiber Cut',
        icon: Icons.content_cut,
        location: '2.4 km away • Sector 7',
        category: 'Backbone',
      ),
      Ticket(
        id: '#TKT-3912',
        timeAgo: '45m ago',
        priority: TicketPriority.high,
        title: 'Router Offline',
        icon: Icons.router,
        location: '5.1 km away • Main Hub',
        category: 'Network',
      ),
      Ticket(
        id: '#TKT-3884',
        timeAgo: '2h ago',
        priority: TicketPriority.normal,
        title: 'New Install',
        icon: Icons.home_repair_service,
        location: '0.8 km away • Residential Block',
        category: 'PSB',
      ),
      Ticket(
        id: '#TKT-3822',
        timeAgo: '3h ago',
        priority: TicketPriority.normal,
        title: 'Switch Maintenance',
        icon: Icons.settings_input_component,
        location: '12.5 km away • North Station',
        category: 'Maintenance',
      ),
    ];
  }
}
