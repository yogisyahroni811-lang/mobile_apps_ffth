import 'package:flutter/material.dart';
import '../../data/models/ticket_model.dart';
import '../../data/repositories/ticket_repository.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  final TicketRepository _ticketRepository = TicketRepository();
  late List<Ticket> _tickets;

  @override
  void initState() {
    super.initState();
    _tickets = _ticketRepository.getTickets();
  }

  @override
  Widget build(BuildContext context) {
    // For now, let's use the dark theme as a baseline
    final bool isDarkMode = true;
    final Color backgroundColor = isDarkMode ? Color(0xFF101922) : Color(0xFFF6F7F8);
    final Color surfaceColor = isDarkMode ? Color(0xFF1D2936) : Colors.white;
    final Color textColor = isDarkMode ? Colors.white : Colors.black;
    final Color primaryColor = Color(0xFF137FEC);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Unified Inbox',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: surfaceColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.sync, color: primaryColor),
            onPressed: () {
              // Handle sync action
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: _buildFilterChips(),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildSearchAndSort()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return TicketListItem(ticket: _tickets[index]);
              },
              childCount: _tickets.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: surfaceColor.withOpacity(0.95),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey[500],
        currentIndex: 0, // Hardcoded for now
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    // Mock filter data
    final filters = ["All Tickets", "PSB", "Maintenance", "Network", "Backbone"];
    final bool isDarkMode = true;
    final Color primaryColor = Color(0xFF137FEC);

    return Container(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          bool isSelected = index == 0;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text(filters[index]),
              selected: isSelected,
              onSelected: (selected) {},
              backgroundColor: isDarkMode ? Color(0xFF1D2936) : Colors.white,
              selectedColor: primaryColor,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : (isDarkMode ? Colors.grey[300] : Colors.grey[600]),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              shape: StadiumBorder(
                side: BorderSide(
                  color: isDarkMode ? Color(0xFF2A3845) : Colors.grey[300]!,
                  width: isSelected ? 0 : 1,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchAndSort() {
    final bool isDarkMode = true;
    final Color surfaceColor = isDarkMode ? Color(0xFF1D2936) : Colors.white;
    final Color borderColor = isDarkMode ? Color(0xFF2A3845) : Colors.grey[300]!;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search ID, type, or location...',
                prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                filled: true,
                fillColor: surfaceColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: borderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: borderColor),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: surfaceColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: borderColor),
            ),
            child: IconButton(
              icon: Icon(Icons.sort, color: Colors.grey[400]),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
