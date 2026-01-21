import 'package:flutter/material.dart';

class NewTicketScreen extends StatelessWidget {
  const NewTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('New Ticket'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What action is being performed?',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Select the specific maintenance category to proceed with the wizard.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: const [
                  TicketTypeCard(
                    icon: Icons.router,
                    title: 'Ganti ONT',
                    subtitle: 'Hardware replacement',
                  ),
                  SizedBox(height: 15),
                  TicketTypeCard(
                    icon: Icons.cable,
                    title: 'Pindah ODP / Tarik Kabel',
                    subtitle: 'Re-stringing or port move',
                  ),
                  SizedBox(height: 15),
                  TicketTypeCard(
                    icon: Icons.move_location,
                    title: 'Pindah Rumah',
                    subtitle: 'Relocation service',
                  ),
                  SizedBox(height: 15),
                  TicketTypeCard(
                    icon: Icons.signal_disconnected,
                    title: 'Perbaikan LOS',
                    subtitle: 'Loss of Signal repair',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TicketTypeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const TicketTypeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Theme.of(context).primaryColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // TODO: Implement navigation
        },
      ),
    );
  }
}
