import 'package:flutter/material.dart';
import '../../data/models/ticket_model.dart';
import '../screens/ticket_detail_screen.dart';

class TicketListItem extends StatelessWidget {
  final Ticket ticket;

  const TicketListItem({Key? key, required this.ticket}) : super(key: key);

  Color _getPriorityColor(TicketPriority priority) {
    switch (priority) {
      case TicketPriority.critical:
        return Colors.red;
      case TicketPriority.high:
        return Colors.orange;
      case TicketPriority.normal:
      default:
        return const Color(0xFF137FEC);
    }
  }

  String _getPriorityText(TicketPriority priority) {
    switch (priority) {
      case TicketPriority.critical:
        return 'Critical';
      case TicketPriority.high:
        return 'High';
      case TicketPriority.normal:
      default:
        return 'Normal';
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = true; // Assuming dark mode for now
    final Color surfaceColor =
        isDarkMode ? const Color(0xFF1D2936) : Colors.white;
    final Color textColor = isDarkMode ? Colors.white : Colors.black87;
    final Color subtextColor =
        isDarkMode ? Colors.grey[400]! : Colors.grey[600]!;
    final Color priorityColor = _getPriorityColor(ticket.priority);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TicketDetailScreen(ticket: ticket),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: surfaceColor,
          borderRadius: BorderRadius.circular(16.0),
          border: Border(left: BorderSide(color: priorityColor, width: 4.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(ticket.id,
                        style: TextStyle(
                            color: subtextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey[600])),
                    const SizedBox(width: 8),
                    Text(ticket.timeAgo,
                        style: TextStyle(color: subtextColor, fontSize: 12)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: priorityColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Text(
                    _getPriorityText(ticket.priority),
                    style: TextStyle(
                        color: priorityColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: priorityColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Icon(ticket.icon, color: priorityColor, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticket.title,
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              color: subtextColor, size: 16),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              ticket.location,
                              style:
                                  TextStyle(color: subtextColor, fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: Colors.grey[600]),
              ],
            ),
            const SizedBox(height: 12),
            Chip(
              label: Text(ticket.category),
              backgroundColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
              labelStyle: TextStyle(
                  color: isDarkMode ? Colors.grey[300] : Colors.grey[700],
                  fontSize: 12),
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
            ),
          ],
        ),
      ),
    );
  }
}
