import 'package:flutter/material.dart';
import '../../data/mock_data.dart';
import '../../data/models/app_models.dart';

class SmartTicketScreen extends StatelessWidget {
  const SmartTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ticket = MockData.smartTicket;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        title: Text(ticket.ticketId),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildTicketStatus(ticket),
          const SizedBox(height: 16.0),
          _buildSymptomCard(ticket),
          const SizedBox(height: 16.0),
          _buildSystemLogAnalysis(ticket),
          const SizedBox(height: 16.0),
          _buildTargetLocation(ticket),
        ],
      ),
      bottomNavigationBar: _buildFooter(),
    );
  }

  Widget _buildTicketStatus(SmartTicket ticket) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Chip(
          label: Text(ticket.status),
          backgroundColor: Colors.red.shade100,
          labelStyle: TextStyle(color: Colors.red.shade800, fontWeight: FontWeight.bold, fontSize: 10.0),
        ),
        Text(ticket.lastUpdate, style: const TextStyle(color: Colors.grey, fontSize: 12.0)),
      ],
    );
  }

  Widget _buildSymptomCard(SmartTicket ticket) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.red.withOpacity(0.1),
              radius: 24.0,
              child: const Icon(Icons.wifi_off, color: Colors.red, size: 28.0),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Current Symptom', style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                  Text(ticket.symptom, style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16.0, color: Colors.grey),
                      const SizedBox(width: 4.0),
                      Text(ticket.area, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSystemLogAnalysis(SmartTicket ticket) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 1.0,
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.terminal, color: Colors.blue),
            title: Text('System Log Analysis', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey.shade900,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              ticket.systemLog,
              style: const TextStyle(fontFamily: 'monospace', color: Colors.white, fontSize: 12.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTargetLocation(SmartTicket ticket) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 1.0,
      child: Column(
        children: [
          ListTile(
            title: const Text('Target Location', style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: TextButton(
              onPressed: () {},
              child: const Text('View details'),
            ),
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(ticket.mapImageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.location_on, color: Colors.red, size: 40.0),
                  Chip(label: Text('ODC-01')),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.business),
            title: Text(ticket.targetLocation),
            subtitle: Text(ticket.targetAddress),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(16.0).copyWith(bottom: 24.0),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.build_circle),
            label: const Text('Start Initial Check'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 8.0),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.navigation),
            label: const Text('Navigate to Location'),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              foregroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
