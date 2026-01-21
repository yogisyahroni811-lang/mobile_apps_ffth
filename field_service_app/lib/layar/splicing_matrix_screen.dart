import 'package:flutter/material.dart';
import 'package:field_service_app/data/splicing_matrix_model.dart';
import 'package:field_service_app/workflow/splicing_matrix_workflow.dart';

// Helper to map enum to actual color
Color getFiberColor(FiberColor color) {
  switch (color) {
    case FiberColor.blue: return Colors.blue;
    case FiberColor.orange: return Colors.orange;
    case FiberColor.green: return Colors.green;
    case FiberColor.brown: return Colors.brown;
    case FiberColor.slate: return Colors.grey;
    case FiberColor.white: return Colors.white;
    case FiberColor.red: return Colors.red;
    case FiberColor.black: return Colors.black;
    case FiberColor.yellow: return Colors.yellow;
    case FiberColor.violet: return Colors.purple;
    case FiberColor.rose: return Colors.pink;
    case FiberColor.aqua: return Colors.cyan;
    default: return Colors.transparent;
  }
}

class SplicingMatrixScreen extends StatefulWidget {
  const SplicingMatrixScreen({Key? key}) : super(key: key);

  @override
  _SplicingMatrixScreenState createState() => _SplicingMatrixScreenState();
}

class _SplicingMatrixScreenState extends State<SplicingMatrixScreen> {
  final SplicingMatrixWorkflow _workflow = SplicingMatrixWorkflow();

  // GlobalKeys to find widget positions
  final Map<int, GlobalKey> _keysA = {};
  final Map<int, GlobalKey> _keysB = {};

  @override
  void initState() {
    super.initState();
    _workflow.loadCables('CABLE-A', 'CABLE-B');
    _assignKeys();
  }

  void _assignKeys() {
    if (_workflow.cableA != null) {
      for (var tube in _workflow.cableA!.tubes) {
        for (var core in tube.cores) {
          _keysA[core.id] = GlobalKey();
        }
      }
    }
    if (_workflow.cableB != null) {
      for (var tube in _workflow.cableB!.tubes) {
        for (var core in tube.cores) {
          _keysB[core.id] = GlobalKey();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDarkMode ? const Color(0xFF101922) : const Color(0xFFF6F7F8);
    final surfaceColor = isDarkMode ? const Color(0xFF1d2935) : Colors.white;

    if (_workflow.cableA == null || _workflow.cableB == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: surfaceColor,
        title: const Text('Splicing Matrix'),
        elevation: 1,
      ),
      body: Stack(
        children: [
          Row(
            children: [
              _buildCableColumn(_workflow.cableA!, surfaceColor, CrossAxisAlignment.start, _keysA, true),
              _buildCableColumn(_workflow.cableB!, surfaceColor, CrossAxisAlignment.end, _keysB, false),
            ],
          ),
          CustomPaint(
            painter: ConnectionPainter(
              connections: _workflow.connections,
              keysA: _keysA,
              keysB: _keysB,
              cableA: _workflow.cableA!,
            ),
            size: Size.infinite,
          ),
        ],
      ),
    );
  }

  Widget _buildCableColumn(FiberCable cable, Color surfaceColor, CrossAxisAlignment alignment, Map<int, GlobalKey> keys, bool isLeft) {
    return Expanded(
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(cable.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cable.tubes.length,
              itemBuilder: (context, index) {
                final tube = cable.tubes[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: alignment,
                    children: [
                      Text('Tube ${tube.id} - ${tube.color.toString().split('.').last}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      ...tube.cores.map((core) => _buildCoreItem(core, surfaceColor, keys[core.id]!, isLeft)).toList(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoreItem(FiberCore core, Color surfaceColor, GlobalKey key, bool isLeft) {
    return Container(
      key: key,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisAlignment: isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if(isLeft) ...[
            Container(width: 12, height: 12, decoration: BoxDecoration(color: getFiberColor(core.color), shape: BoxShape.circle)),
            const SizedBox(width: 8),
            Text('Core ${core.id} - ${core.name}'),
          ],
          if(!isLeft) ...[
            Text('Core ${core.id} - ${core.name}'),
            const SizedBox(width: 8),
            Container(width: 12, height: 12, decoration: BoxDecoration(color: getFiberColor(core.color), shape: BoxShape.circle)),
          ],
        ],
      ),
    );
  }
}

class ConnectionPainter extends CustomPainter {
  final List<SpliceConnection> connections;
  final Map<int, GlobalKey> keysA;
  final Map<int, GlobalKey> keysB;
  final FiberCable cableA;

  ConnectionPainter({required this.connections, required this.keysA, required this.keysB, required this.cableA});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    for (var connection in connections) {
      final keyA = keysA[connection.fromCoreId];
      final keyB = keysB[connection.toCoreId];

      if (keyA?.currentContext != null && keyB?.currentContext != null) {
        final renderBoxA = keyA.currentContext!.findRenderObject() as RenderBox;
        final renderBoxB = keyB.currentContext!.findRenderObject() as RenderBox;

        final posA = renderBoxA.localToGlobal(Offset(renderBoxA.size.width, renderBoxA.size.height / 2));
        final posB = renderBoxB.localToGlobal(Offset(0, renderBoxB.size.height / 2));

        final path = Path();
        path.moveTo(posA.dx, posA.dy);
        path.cubicTo(posA.dx + 100, posA.dy, posB.dx - 100, posB.dy, posB.dx, posB.dy);

        // Use the color of the source fiber
        final core = cableA.tubes.expand((tube) => tube.cores).firstWhere((core) => core.id == connection.fromCoreId);
        paint.color = getFiberColor(core.color).withOpacity(0.7);

        canvas.drawPath(path, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
