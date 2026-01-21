enum TicketType {
  gantiOnt,
  pindahOdp,
  pindahRumah,
  perbaikanLos,
}

class Ticket {
  final String id;
  final TicketType type;
  final String description;

  Ticket({
    required this.id,
    required this.type,
    required this.description,
  });
}
