import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:field_technician_app/data/repositories/ticket_repository.dart';
import 'new_ticket_event.dart';
import 'new_ticket_state.dart';

class NewTicketBloc extends Bloc<NewTicketEvent, NewTicketState> {
  final TicketRepository ticketRepository;

  NewTicketBloc({required this.ticketRepository}) : super(NewTicketInitial()) {
    on<LoadTickets>(_onLoadTickets);
  }

  void _onLoadTickets(LoadTickets event, Emitter<NewTicketState> emit) {
    try {
      emit(NewTicketLoading());
      final tickets = ticketRepository.getTickets();
      emit(NewTicketLoaded(tickets));
    } catch (e) {
      emit(NewTicketError(e.toString()));
    }
  }
}
