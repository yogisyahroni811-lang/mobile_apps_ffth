import 'package:flutter/material.dart';
import '../../data/mock_data.dart';
import '../../data/models/app_models.dart';

class OltHardwareSwapScreen extends StatelessWidget {
  const OltHardwareSwapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Column(
          children: [
            Text('Replacement Mode', style: TextStyle(fontSize: 16.0)),
            Text('Card/SFP Swap', style: TextStyle(fontSize: 12.0)),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildHeaderInfo(),
          const SizedBox(height: 16.0),
          _buildTargetChassis(),
          const Divider(height: 32.0),
          _buildDecommissionSection(),
          const Divider(height: 32.0),
          _buildProvisionSfpSection(),
          const Divider(height: 32.0),
          _buildNmsLinkStatusSection(),
          const SizedBox(height: 120.0), // Padding for the footer
        ],
      ),
      bottomNavigationBar: _buildFooter(),
    );
  }

  Widget _buildHeaderInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.dns, size: 16.0, color: Colors.grey),
            const SizedBox(width: 8.0),
            const Text(
              'DC-04 / Row 12 / Rack 4B',
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: const Text(
            'TKT-4928',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 10.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTargetChassis() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Target Chassis',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: const Text(
                        'Status: ALARM',
                        style: TextStyle(color: Colors.white, fontSize: 10.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(
                      'Slot 0 / Port 4',
                      style: TextStyle(fontFamily: 'monospace', fontSize: 10.0, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: MockData.ports.length,
              itemBuilder: (context, index) {
                return _buildPortItem(MockData.ports[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPortItem(Port port) {
    return Container(
      decoration: BoxDecoration(
        color: port.isAlarm ? Colors.red.withOpacity(0.2) : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: port.isAlarm ? Colors.red : Colors.grey.shade300,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              '${port.portNumber}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: port.isAlarm ? Colors.red : Colors.black,
              ),
            ),
          ),
          if (port.isActive)
            Positioned(
              top: 4,
              right: 4,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDecommissionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('01', 'Decommission'),
        const SizedBox(height: 16.0),
        _buildPowerMetricsCard(),
        const SizedBox(height: 16.0),
        _buildTextInput(label: 'Scan Old SFP Serial', hint: 'Scanning...'),
        const SizedBox(height: 16.0),
        _buildDropdownInput(
          label: 'Fault Reason',
          items: ['Rx Low Power (-28dBm)', 'Tx Laser Failure', 'High CRC Errors', 'Physical Damage'],
        ),
      ],
    );
  }

  Widget _buildProvisionSfpSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('02', 'Provision New SFP', isPrimary: true),
        const SizedBox(height: 16.0),
        _buildTextInput(label: 'Scan New Serial Number', value: 'FNS239482L', isSuccess: true),
        const SizedBox(height: 16.0),
        _buildCompatibilityCard(),
      ],
    );
  }

  Widget _buildSectionTitle(String number, String title, {bool isPrimary = false}) {
    return Row(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: isPrimary ? Colors.blue : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                color: isPrimary ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'monospace',
              ),
            ),
          ),
        ),
        const SizedBox(width: 12.0),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
      ],
    );
  }

  Widget _buildPowerMetricsCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      color: Colors.grey.shade100,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Historical Power Metrics (Last 1hr)',
              style: TextStyle(fontSize: 10.0, color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
              itemCount: MockData.powerMetrics.length,
              itemBuilder: (context, index) {
                final metric = MockData.powerMetrics[index];
                return _buildMetricItem(metric.name, metric.value, isAlarm: metric.isAlarm);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricItem(String name, String value, {bool isAlarm = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: const TextStyle(fontFamily: 'monospace', fontSize: 10.0, color: Colors.grey)),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
            color: isAlarm ? Colors.red : Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildTextInput({required String label, String? hint, String? value, bool isSuccess = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          initialValue: value,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
            isDense: true,
            suffixIcon: Icon(
              isSuccess ? Icons.check_circle : Icons.qr_code_scanner,
              color: isSuccess ? Colors.green : Colors.grey,
            ),
          ),
          style: const TextStyle(fontFamily: 'monospace'),
        ),
      ],
    );
  }

  Widget _buildDropdownInput({required String label, required List<String> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        DropdownButtonFormField<String>(
          value: items.first,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
            isDense: true,
          ),
        ),
      ],
    );
  }

  Widget _buildCompatibilityCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      color: Colors.grey.shade100,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.verified, color: Colors.green, size: 16.0),
                const SizedBox(width: 8.0),
                const Text(
                  'Compatibility Validation',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            ...MockData.compatibilityCheckItems.map((item) {
              return _buildCompatibilityCheckItem(item.property, item.value);
            }).expand((widget) => [widget, const Divider()]).toList()..removeLast(),
          ],
        ),
      ),
    );
  }

  Widget _buildCompatibilityCheckItem(String property, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(property, style: const TextStyle(fontSize: 12.0, color: Colors.grey)),
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 4.0),
              const Icon(Icons.check, color: Colors.green, size: 16.0),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNmsLinkStatusSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.monitor_heart, color: Colors.grey),
            SizedBox(width: 8.0),
            Text(
              'NMS Link Status',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          color: Colors.grey.shade900,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                ...MockData.nmsStatusItems.map((item) {
                  return _buildNmsStatusItem(item.property, item.value, color: item.color, isBold: item.isBold);
                }),
                const SizedBox(height: 8.0),
                LinearProgressIndicator(
                  value: 1.0, // Represents the "DOWN" state, full bar
                  backgroundColor: Colors.grey.shade800,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                ),
                const SizedBox(height: 4.0),
                const Text(
                  'Waiting for new hardware...',
                  style: TextStyle(color: Colors.grey, fontSize: 10.0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNmsStatusItem(String property, String value, {Color? color, bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            property,
            style: const TextStyle(fontFamily: 'monospace', color: Colors.grey, fontSize: 12.0),
          ),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'monospace',
              color: color ?? Colors.white,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(16.0).copyWith(bottom: 24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.admin_panel_settings),
            label: const Text('Request Admin Approval'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 8.0),
              const Text(
                'NOC Gateway: Connected',
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 10.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
