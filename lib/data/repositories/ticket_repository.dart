import '../providers/mock_data_provider.dart';
import '../models/ticket.dart';

class TicketRepository {
  final MockDataProvider _dataProvider;

  TicketRepository({MockDataProvider? dataProvider})
      : _dataProvider = dataProvider ?? MockDataProvider();

  List<Ticket> getTickets() {
    return _dataProvider.getTickets();
  }
}
