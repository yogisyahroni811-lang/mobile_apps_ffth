import 'package:flutter/material.dart';
import '../../data/models/ticket_model.dart';

class TicketDetailScreen extends StatelessWidget {
  final Ticket ticket;

  const TicketDetailScreen({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(ticket.title)),
      body: Center(child: Text('Ticket Details for ${ticket.id}')),
    );
  }
}
