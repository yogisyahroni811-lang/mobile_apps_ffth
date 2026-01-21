import 'package:flutter/material.dart';

class DismantleChecklistScreen2 extends StatelessWidget {
  const DismantleChecklistScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Dismantle Verification'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.help_outline),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProgressIndicator(),
            _buildInstructionCard(),
            _buildDeviceChecklist(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 6,
                width: 32,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(width: 4),
              Container(
                height: 6,
                width: 8,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(width: 4),
              Container(
                height: 6,
                width: 8,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(width: 4),
              Container(
                height: 6,
                width: 8,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text('Step 1 of 4: Device Check',
              style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildInstructionCard() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        color: Color.fromARGB(255, 227, 242, 253),
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info, color: Colors.blue),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Prepare for Relocation',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 4),
                    Text(
                        'Please ensure you have all devices and take a clear photo of each before packing.'),
                    SizedBox(height: 8),
                    Text('Relocation ID: #REL-2938',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeviceChecklist() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          DeviceCard(
            icon: Icons.router,
            title: 'ONT Device (Modem)',
            subtitle: 'Capture serial number label',
            status: 'Pending',
            statusColor: Colors.orange,
            isVerified: false,
          ),
          SizedBox(height: 16),
          DeviceCard(
            icon: Icons.power,
            title: 'Power Adaptor',
            subtitle: 'Include cable in shot',
            status: 'Done',
            statusColor: Colors.green,
            isVerified: true,
            imageUrl:
                'https://lh3.googleusercontent.com/aida-public/AB6AXuCLbVbiphmahjXVnSZBCYg636ETWL_KSXW3cd4LHQVEL97f9kcDwHvsffg6eDO4U7_RL1pjhiF7y7Fr4cUTos3xbqLyTEPqotL_SIYXkf5PWbDV_GuX6FD7M7I8hqv-dfpn8aprqX7pWcEm76eI0FhKcDnPbI50sB2ug7LF0ccAwbEjXyQ3kRm4-C7yCmn7IRV2x2dDhdeKtLgZUhd57VLmHbrm2467w7S9nLs8CQGrD8w7yJsqxk8I7MqzDZi1M6d9qZjonYBM5hA',
          ),
          SizedBox(height: 16),
          DeviceCard(
            icon: Icons.tv,
            title: 'Set Top Box (STB)',
            subtitle: 'Capture top-down view',
            status: 'Pending',
            statusColor: Colors.orange,
            isVerified: false,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('1 of 3 items captured'),
                Text(
                  'Incomplete',
                  style: TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: null, // Disabled
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Proceed to Mapping'),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeviceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String status;
  final Color statusColor;
  final bool isVerified;
  final String? imageUrl;

  const DeviceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.statusColor,
    required this.isVerified,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon, size: 40, color: Colors.grey[600]),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(subtitle,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ),
                Chip(
                  label: Text(status),
                  backgroundColor: statusColor.withOpacity(0.2),
                )
              ],
            ),
            const SizedBox(height: 16),
            if (isVerified)
              SizedBox(
                height: 150,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  border: Border.all(
                      color: Colors.grey[400]!,
                      width: 2,
                      style: BorderStyle.solid),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_a_photo, color: Colors.blue, size: 40),
                    SizedBox(height: 8),
                    Text('Tap to take photo',
                        style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
