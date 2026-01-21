import 'package:flutter/material.dart';

// Fiber color mapping
const Map<String, Color> fiberColors = {
  'blue': Color(0xFF0055FF),
  'orange': Color(0xFFFF7F00),
  'green': Color(0xFF008000),
  'brown': Color(0xFFA52A2A),
  'slate': Color(0xFF808080),
  'white': Color(0xFFFFFFFF),
  'red': Color(0xFFFF0000),
  'black': Color(0xFF000000),
  'yellow': Color(0xFFFFFF00),
  'violet': Color(0xFF800080),
  'rose': Color(0xFFFFC0CB),
  'aqua': Color(0xFF00FFFF),
};

class SplicingMatrixScreen extends StatelessWidget {
  const SplicingMatrixScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Theme colors from the design
    final Color backgroundColor = Color(0xFF0B1219);
    final Color surfaceColor = Color(0xFF151F28);
    final Color dividerColor = Color(0xFF2A3845);
    final Color primaryColor = Color(0xFF137FEC);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.0),
        child: AppBar(
          backgroundColor: surfaceColor,
          elevation: 0,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildAppBarTop(primaryColor),
              _buildAppBarBottom(dividerColor),
            ],
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Splicing Matrix Screen - In Progress',
          style: TextStyle(color: Colors.white),
        ),
      ),
      // FABs and bottom banner will be added later
    );
  }

  Widget _buildAppBarTop(Color primaryColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('144-Core Master Board', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 4),
              Row(
                children: [
                  Container(width: 8, height: 8, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green[500])),
                  SizedBox(width: 8),
                  Text('Live Splicing • Ticket #9482', style: TextStyle(color: Colors.grey[400], fontSize: 11)),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xFF1E2B38),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xFF2A3845)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.link, color: primaryColor, size: 16),
                    SizedBox(width: 4),
                    Text('26/144', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.more_vert, color: Colors.grey[400]),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarBottom(Color dividerColor) {
    return Container(
      color: Color(0xFF0F161D),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(border: Border(right: BorderSide(color: dividerColor))),
              child: Column(
                children: [
                  Text('KABEL A (Source)', style: TextStyle(color: Colors.blue[400], fontWeight: FontWeight.bold, fontSize: 12)),
                  Text('ADSS-144-SM', style: TextStyle(color: Colors.grey[500], fontSize: 10)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Icon(Icons.swap_horiz, color: Colors.grey[600]),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(border: Border(left: BorderSide(color: dividerColor))),
              child: Column(
                children: [
                  Text('KABEL B (Target)', style: TextStyle(color: Colors.orange[400], fontWeight: FontWeight.bold, fontSize: 12)),
                  Text('UG-144-SM', style: TextStyle(color: Colors.grey[500], fontSize: 10)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
