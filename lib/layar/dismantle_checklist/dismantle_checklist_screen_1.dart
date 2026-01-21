import 'package:flutter/material.dart';

class DismantleChecklistScreen1 extends StatelessWidget {
  const DismantleChecklistScreen1({super.key});

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
            _buildRelocationDetails(),
            _buildInstructionCard(),
            _buildDeviceChecklist(),
            _buildAdditionalNotes(),
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

  Widget _buildRelocationDetails() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Relocation Details',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Chip(
                    label: Text('#REL-2938'),
                    backgroundColor: Color.fromARGB(255, 201, 222, 255),
                  ),
                ],
              ),
              SizedBox(height: 16),
              InfoRow(
                  icon: Icons.person,
                  label: 'Customer Name',
                  value: 'Sarah Jenkins'),
              SizedBox(height: 16),
              InfoRow(
                  icon: Icons.location_on,
                  label: 'Current Location (Dismantle)',
                  value: 'Apartment 4B, 123 Maple Street, Springfield'),
            ],
          ),
        ),
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
                        'Please ensure you have all devices and take a clear photo of each before packing. Verify serial numbers.'),
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
            status: 'Verified',
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

  Widget _buildAdditionalNotes() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Additional Notes',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText:
                      'Add any comments about the dismantle process or device condition here...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Progress'),
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: LinearProgressIndicator(
                            value: 0.33,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text('33%'),
                      ],
                    ),
                  ],
                ),
                Chip(
                  label: Text('Incomplete'),
                  backgroundColor: Color.fromARGB(255, 255, 224, 178),
                  avatar: Icon(Icons.warning, color: Colors.orange),
                )
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

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.grey, size: 20),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 2),
              Text(value, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ],
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
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey)),
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
                  border: Border.all(color: Colors.grey[400]!,
                   width: 2, style: BorderStyle.solid),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_a_photo, color: Colors.blue),
                    SizedBox(height: 8),
                    Text('Tap to take photo',
                        style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(
                    child:
                        CustomTextField(label: 'Serial Number (SN)',
                        hint: 'Scan or enter SN')),
                SizedBox(width: 16),
                Expanded(child: CustomDropdown(label: 'Device Condition')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;

  const CustomTextField({super.key, required this.label, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            suffixIcon: const Icon(Icons.qr_code_scanner),
          ),
        ),
      ],
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final String label;

  const CustomDropdown({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 8),
        DropdownButtonFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
          ),
          items: const [
            DropdownMenuItem(value: 'Good', child: Text('Good Condition')),
            DropdownMenuItem(
                value: 'Scratched', child: Text('Minor Scratches')),
            DropdownMenuItem(value: 'Damaged', child: Text('Damaged / Broken')),
            DropdownMenuItem(value: 'Missing', child: Text('Missing')),
          ],
          onChanged: (value) {},
        ),
      ],
    );
  }
}
