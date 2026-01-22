import 'package:flutter/material.dart';
import 'package:field_service_app/data/odp_bulk_swap_model.dart';

class OdpBulkSwapScreen extends StatefulWidget {
  const OdpBulkSwapScreen({Key? key}) : super(key: key);

  @override
  _OdpBulkSwapScreenState createState() => _OdpBulkSwapScreenState();
}

class _OdpBulkSwapScreenState extends State<OdpBulkSwapScreen> {
  late OdpDevice oldDevice;
  late OdpDevice newDevice;
  final Map<String, GlobalKey> _oldKeys = {};
  final Map<String, GlobalKey> _newKeys = {};

  @override
  void initState() {
    super.initState();
    _generateMockData();
  }

  void _generateMockData() {
    oldDevice = OdpDevice(
      id: 'ODP-OLD-8821',
      ports: List.generate(8, (i) {
        String id = 'P-${i + 1}';
        _oldKeys[id] = GlobalKey();
        PortStatus status = PortStatus.active;
        if (i == 3) status = PortStatus.faulty;
        if (i > 5) status = PortStatus.empty;
        return Port(id: id, status: status);
      }),
    );

    newDevice = OdpDevice(
      id: 'ODP-NEW-9932',
      ports: List.generate(8, (i) {
        String id = 'P-${i + 1}';
        _newKeys[id] = GlobalKey();
        return Port(id: id, status: PortStatus.empty);
      }),
    );

    // Default 1-to-1 mapping, skipping faulty
    for (var port in oldDevice.ports) {
      if (port.status == PortStatus.active) {
        port.mappedToPortId = port.id;
      }
    }

    // Apply overrides from the design
    // P-03 -> P-05
    oldDevice.ports.firstWhere((p) => p.id == 'P-3').mappedToPortId = 'P-5';
    // P-05 -> P-03
    oldDevice.ports.firstWhere((p) => p.id == 'P-5').mappedToPortId = 'P-3';
  }

  bool isOverride(Port port) {
    return port.mappedToPortId != null && port.id != port.mappedToPortId;
  }

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFF111a22);
    const surfaceColor = Color(0xFF1d2935);
    const primaryColor = Color(0xFF137fec);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: const Text('ODP Swap Wizard'),
        elevation: 1,
      ),
      body: Column(
        children: [
          _buildHeader(),
          _buildColumnTitles(),
          Expanded(
            child: Stack(
              children: [
                Row(
                  children: [
                    _buildPortColumn(oldDevice, _oldKeys, true),
                    const SizedBox(width: 60), // Space for lines
                    _buildPortColumn(newDevice, _newKeys, false),
                  ],
                ),
                CustomPaint(
                  painter: ConnectionPainter(
                    ports: oldDevice.ports,
                    oldKeys: _oldKeys,
                    newKeys: _newKeys,
                  ),
                  size: Size.infinite,
                ),
              ],
            ),
          ),
          _buildFooter(primaryColor),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    // Simplified header for brevity
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFF0b1219),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Old Device: ODP-OLD-8821'),
          const Icon(Icons.arrow_forward),
          const Text('New Device: ODP-NEW-9932'),
        ],
      ),
    );
  }

  Widget _buildColumnTitles() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('OLD (16)'),
          const Text('NEW (16)'),
        ],
      ),
    );
  }

  Widget _buildPortColumn(OdpDevice device, Map<String, GlobalKey> keys, bool isOldDevice) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: device.ports.length,
        itemBuilder: (context, index) {
          final port = device.ports[index];
          bool override = isOldDevice && isOverride(port);
          return _buildPortItem(port, keys[port.id]!, isOldDevice, override);
        },
      ),
    );
  }

  Widget _buildPortItem(Port port, GlobalKey key, bool isOldDevice, bool isOverride) {
    Color borderColor = const Color(0xFF1d2935);
    Color bgColor = const Color(0xFF1d2935);
    Color textColor = Colors.white;

    if (port.status == PortStatus.faulty) {
      borderColor = Colors.red.withOpacity(0.3);
      bgColor = Colors.red.withOpacity(0.1);
      textColor = Colors.grey;
    } else if (port.status == PortStatus.empty) {
      borderColor = Colors.grey.withOpacity(0.3);
      bgColor = Colors.transparent;
      textColor = Colors.grey;
    } else if (isOverride) {
      borderColor = const Color(0xFF137fec).withOpacity(0.5);
    }

    return Container(
      key: key,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(!isOldDevice)
            CircleAvatar(radius: 4, backgroundColor: isOverride ? const Color(0xFF137fec) : Colors.grey),
          Text(port.id, style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
          if(isOldDevice)
            CircleAvatar(radius: 4, backgroundColor: isOverride ? const Color(0xFF137fec) : Colors.grey),
        ],
      ),
    );
  }

  Widget _buildFooter(Color primaryColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFF1d2935),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.swap_calls),
        label: const Text('Execute Swap'),
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          minimumSize: const Size(double.infinity, 50),
        ),
      ),
    );
  }
}

class ConnectionPainter extends CustomPainter {
  final List<Port> ports;
  final Map<String, GlobalKey> oldKeys;
  final Map<String, GlobalKey> newKeys;

  ConnectionPainter({required this.ports, required this.oldKeys, required this.newKeys});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final overridePaint = Paint()
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..color = const Color(0xFF137fec);

    for (var port in ports) {
      if (port.mappedToPortId != null) {
        final oldKey = oldKeys[port.id];
        final newKey = newKeys[port.mappedToPortId!];

        if (oldKey?.currentContext != null && newKey?.currentContext != null) {
          final oldBox = oldKey.currentContext!.findRenderObject() as RenderBox;
          final newBox = newKey.currentContext!.findRenderObject() as RenderBox;

          final startPos = oldBox.localToGlobal(Offset(oldBox.size.width, oldBox.size.height / 2));
          final endPos = newBox.localToGlobal(Offset(0, newBox.size.height / 2));

          final path = Path();
          path.moveTo(startPos.dx, startPos.dy);
          path.cubicTo(startPos.dx + 40, startPos.dy, endPos.dx - 40, endPos.dy, endPos.dx, endPos.dy);

          final isOverride = port.id != port.mappedToPortId;
          if (isOverride) {
            overridePaint.shader = const LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent]).createShader(path.getBounds());
            canvas.drawPath(path, overridePaint);
          } else {
            paint.color = Colors.grey;
            canvas.drawPath(path, paint);
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
