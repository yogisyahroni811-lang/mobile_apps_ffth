import 'package:flutter/material.dart';
import '../../data/mock_data.dart';
import '../../data/models/app_models.dart';
import 'dart:ui';

class BackbonePopDiagnosticScreen extends StatefulWidget {
  const BackbonePopDiagnosticScreen({Key? key}) : super(key: key);

  @override
  _BackbonePopDiagnosticScreenState createState() => _BackbonePopDiagnosticScreenState();
}

class _BackbonePopDiagnosticScreenState extends State<BackbonePopDiagnosticScreen> {
  bool _plnEngaged = MockData.powerSourceStatus.plnEngaged;
  String _upsStatus = MockData.powerSourceStatus.upsStatus;
  int _coolingStatusIndex = MockData.environmentalChassisStatus.coolingStatus == 'OK' ? 0 : 1;
  int _chassisStatusIndex = MockData.environmentalChassisStatus.chassisStatus == 'UP' ? 0 : 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Backbone Diagnostic'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Help'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildStatusCard(),
          const SizedBox(height: 24.0),
          _buildPowerSourceStatusSection(),
          const SizedBox(height: 24.0),
          _buildEnvironmentalChassisSection(),
          const SizedBox(height: 24.0),
          _buildPhotoEvidenceSection(),
          const SizedBox(height: 120.0), // Padding for footer
        ],
      ),
      bottomNavigationBar: _buildFooter(),
    );
  }

  Widget _buildStatusCard() {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 1.0,
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCOxMVPKvSDuh9NI16uf0sL8vQrWJiQyQIgTgdVVwjYN09cmxtpReO85b_9ezrP2VCY5YsdIbqV0YlRJoy--kwaL0afQISNDeFROATOwuEPN82wGlHNFTONfkdu242K0YXNnjKNJ9pGevXyyiIb2NACxW0qHXbpr5T6aOdu7gCkQANB7hUCXcVBgXBjTV3iMlXGmExuCGkfzy8wiyY7NBjKpEKaJIl8sWQ5kJlUYmGbjtcfAnWxhlCv9c5hGfvwV1US9gKE4kUonyM'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'POP-392: Sector 4',
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4.0),
                          const Row(
                            children: [
                              Icon(Icons.location_on, size: 16.0, color: Colors.grey),
                              SizedBox(width: 4.0),
                              Text('Data Center B, Row 12', style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          Text(
                            'Ticket #INC-9928 • Open for 24m',
                            style: TextStyle(color: Colors.grey.shade400, fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Chip(
                  label: const Text('CRITICAL OUTAGE'),
                  backgroundColor: Colors.red.shade100,
                  labelStyle: TextStyle(color: Colors.red.shade800, fontWeight: FontWeight.bold, fontSize: 10.0),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.red.shade600,
                    radius: 4.0,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
              ),
            ],
          ),
          Container(
            height: 64,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAGnpAWjk6MpbyK4QlT3DP8sBsVPAf1Bny3seTahya4LkzdMFzJq1aR_YgNPIDngh68avKippafYEgFDCJCwyCCNgnyVc6L2Szu1-Are4_KMuWGS2woSRsjwFcjIt9V1bokShhPfckTLCZFjtXBif6JR5gYW7YtmKvUmmn5yl9Zd-PT_zKZ5haCYbW6hEs1fpuaa1R7wC07MjY2VgEfVLwSIYn5e4xJ4AVcKSFUlVbiUv3jUF4rGmP_cE8slinUQ89GaDrytzIUaSQ'),
                fit: BoxFit.cover,
                opacity: 0.5,
              ),
            ),
            child: Center(
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.map),
                label: const Text('View on Map'),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.8),
                  foregroundColor: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPowerSourceStatusSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(Icons.bolt, 'Power Source Status'),
        const SizedBox(height: 8.0),
        Card(
          elevation: 1.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('PLN (Main Grid)', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Is the main breaker engaged?', style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                      ],
                    ),
                    Switch(value: _plnEngaged, onChanged: (value) => setState(() => _plnEngaged = value)),
                  ],
                ),
                const Divider(height: 24.0),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('UPS System Status', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 8.0),
                _buildRadioOption('Running on Battery', '~45m', 'Running on Battery'),
                _buildRadioOption('Normal Operation', null, 'Normal Operation'),
                _buildRadioOption('System Fault / Error', null, 'System Fault / Error', isError: true),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEnvironmentalChassisSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(Icons.thermostat, 'Environmental & Chassis'),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: _buildTwoStateWidget('Cooling', ['OK', 'FAIL'], _coolingStatusIndex, (index) {
                setState(() {
                  _coolingStatusIndex = index;
                });
              }),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: _buildTwoStateWidget('Chassis', ['UP', 'DOWN'], _chassisStatusIndex, (index) {
                setState(() {
                  _chassisStatusIndex = index;
                });
              }),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionHeader(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: Colors.yellow.shade700),
        const SizedBox(width: 8.0),
        Text(title, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildRadioOption(String title, String? subtitle, String value, {bool isError = false}) {
    return RadioListTile<String>(
      title: Text(title, style: TextStyle(color: isError ? Colors.red : null)),
      subtitle: subtitle != null ? Text(subtitle) : null,
      value: value,
      groupValue: _upsStatus,
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _upsStatus = newValue;
          });
        }
      },
      activeColor: isError ? Colors.red : Colors.yellow.shade700,
    );
  }

  Widget _buildTwoStateWidget(String title, List<String> options, int selectedIndex, void Function(int) onSelected) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            ToggleButtons(
              isSelected: List.generate(options.length, (index) => index == selectedIndex),
              onPressed: onSelected,
              borderRadius: BorderRadius.circular(8.0),
              children: options
                  .map((option) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(option),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoEvidenceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSectionHeader(Icons.camera_alt, 'Photo Evidence'),
            const Chip(
              label: Text('Required'),
              backgroundColor: Color.fromARGB(255, 222, 222, 222),
              padding: EdgeInsets.symmetric(horizontal: 8.0),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        InkWell(
          onTap: () {},
          child: CustomPaint(
            painter: DashedBorderPainter(),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 24.0,
                    backgroundColor: Color.fromARGB(255, 235, 235, 235),
                    child: Icon(Icons.add_a_photo, color: Colors.grey),
                  ),
                  SizedBox(height: 12.0),
                  Text('Tap to capture breaker status', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Make sure the serial number is visible', style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        const Text('Technician Notes (Optional)', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8.0),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Describe any additional observations...',
          ),
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(16.0).copyWith(bottom: 24.0),
      color: Colors.white,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.check_circle),
        label: const Text('MARK POWER RESTORED'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 48),
          backgroundColor: Colors.yellow.shade600,
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(12.0)));

    final dashedPath = _dashPath(path, dashArray: _CircularIntervalList<double>([10.0, 5.0]));

    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

Path _dashPath(
  Path source, {
  required _CircularIntervalList<double> dashArray,
}) {
  final Path dest = Path();
  for (final PathMetric metric in source.computeMetrics()) {
    double distance = 0.0;
    bool draw = true;
    while (distance < metric.length) {
      final double len = dashArray.next;
      if (draw) {
        dest.addPath(metric.extractPath(distance, distance + len), Offset.zero);
      }
      distance += len;
      draw = !draw;
    }
  }
  return dest;
}

class _CircularIntervalList<T> {
  _CircularIntervalList(this._values);
  final List<T> _values;
  int _idx = 0;
  T get next {
    if (_idx >= _values.length) {
      _idx = 0;
    }
    return _values[_idx++];
  }
}
