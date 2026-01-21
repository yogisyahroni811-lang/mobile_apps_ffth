abstract class NewTicketEvent {}

class LoadTickets extends NewTicketEvent {}

class SelectTicketType extends NewTicketEvent {
  final String ticketTypeId;
  SelectTicketType(this.ticketTypeId);
}
