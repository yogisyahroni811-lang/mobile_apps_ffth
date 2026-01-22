import 'package:flutter/material.dart';
import 'package:field_technician_app/layar/hardware_swap/hardware_swap_screen.dart';
import 'package:field_technician_app/layar/path_overwrite/path_overwrite_screen.dart';
import 'package:field_technician_app/layar/dismantle_checklist/dismantle_checklist_screen_1.dart';
import 'package:field_technician_app/layar/incident_mapping/incident_mapping_screen.dart';

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
                children: [
                  TicketTypeCard(
                    icon: Icons.router,
                    title: 'Ganti ONT',
                    subtitle: 'Hardware replacement',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const HardwareSwapScreen()));
                    },
                  ),
                  const SizedBox(height: 15),
                  TicketTypeCard(
                    icon: Icons.cable,
                    title: 'Pindah ODP / Tarik Kabel',
                    subtitle: 'Re-stringing or port move',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PathOverwriteScreen()));
                    },
                  ),
                  const SizedBox(height: 15),
                  TicketTypeCard(
                    icon: Icons.location_on,
                    title: 'Pindah Rumah',
                    subtitle: 'Relocation service',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const DismantleChecklistScreen1()));
                    },
                  ),
                  const SizedBox(height: 15),
                  TicketTypeCard(
                    icon: Icons.signal_wifi_off,
                    title: 'Perbaikan LOS',
                    subtitle: 'Loss of Signal repair',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const IncidentMappingScreen()));
                    },
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
  final VoidCallback? onTap;

  const TicketTypeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
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
        onTap: onTap,
      ),
    );
  }
}
