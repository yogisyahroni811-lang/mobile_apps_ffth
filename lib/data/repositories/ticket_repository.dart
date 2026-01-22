import '../providers/mock_data_provider.dart';
import '../models/ticket_model.dart';

class TicketRepository {
  final MockDataProvider _dataProvider;

  TicketRepository({MockDataProvider? dataProvider})
      : _dataProvider = dataProvider ?? MockDataProvider();

  List<Ticket> getTickets() {
    return _dataProvider.getTickets();
  }
}
