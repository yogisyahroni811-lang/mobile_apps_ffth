import 'package:field_technician_app/data/models/ticket.dart';

abstract class NewTicketState {}

class NewTicketInitial extends NewTicketState {}

class NewTicketLoading extends NewTicketState {}

class NewTicketLoaded extends NewTicketState {
  final List<Ticket> tickets;
  NewTicketLoaded(this.tickets);
}

class NewTicketError extends NewTicketState {
  final String message;
  NewTicketError(this.message);
}
