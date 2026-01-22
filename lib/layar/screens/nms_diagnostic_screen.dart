import 'package:flutter/material.dart';

class NmsDiagnosticScreen extends StatelessWidget {
  const NmsDiagnosticScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = true; // Assuming dark mode
    final Color backgroundColor =
        isDarkMode ? Color(0xFF0B1116) : Color(0xFFF6F7F8);
    final Color cardColor = isDarkMode ? Color(0xFF161F29) : Colors.white;
    final Color textColor = isDarkMode ? Colors.white : Colors.black;
    final Color subtextColor =
        isDarkMode ? Colors.grey[400]! : Colors.grey[600]!;
    final Color primaryColor = Color(0xFF2b8cee);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text('Ticket #TKT-8921',
            style: TextStyle(
                color: textColor, fontSize: 16.0, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: textColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.grey[500]),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoGrid(cardColor, primaryColor),
            const SizedBox(height: 16),
            _buildAiInsightCard(),
            const SizedBox(height: 16),
            _buildLiveDiagnostics(cardColor),
            const SizedBox(height: 16),
            _buildAlarmLog(cardColor),
          ],
        ),
      ),
      bottomNavigationBar: _buildFooter(backgroundColor),
    );
  }

  Widget _buildInfoGrid(Color cardColor, Color primaryColor) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 2.2,
      children: [
        _buildInfoCard(cardColor, 'Affected Asset', 'ODC-01 Cabinet',
            Icons.router, primaryColor),
        _buildInfoCard(cardColor, 'Severity', 'CRITICAL', null, null,
            textColor: Colors.red[400]),
        _buildInfoCard(
            cardColor, 'Duration', '42m 15s', Icons.schedule, Colors.grey[400]),
        _buildInfoCard(
            cardColor, 'Impact', '50 Subs', Icons.group_off, Colors.grey[400]),
      ],
    );
  }

  Widget _buildInfoCard(Color cardColor, String title, String value,
      IconData? icon, Color? iconColor,
      {Color? textColor}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[800]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.toUpperCase(),
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 11,
                  fontWeight: FontWeight.w500)),
          const Spacer(),
          Row(
            children: [
              if (icon != null)
                Icon(icon, color: iconColor, size: 20)
              else
                Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red[400])),
              const SizedBox(width: 8),
              Text(value,
                  style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAiInsightCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1e2330), Color(0xFF16202e)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.indigo.shade900.withOpacity(0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.indigo.shade500.withOpacity(0.2),
            child: Icon(Icons.auto_awesome, color: Colors.indigo.shade400),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Likely Cause: Local Power Outage',
                  style: TextStyle(
                    color: Colors.indigo.shade100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Pattern matches "Dying Gasp" sequence from multiple nodes in Sector 4.',
                  style: TextStyle(
                    color: Colors.indigo.shade300,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLiveDiagnostics(Color cardColor) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[800]!),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red[400])),
                    const SizedBox(width: 8),
                    Text('NMS Live Diagnostics',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Text('REFRESH: 5s',
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 10,
                        fontFamily: 'monospace')),
              ],
            ),
          ),
          Divider(color: Colors.grey[800], height: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 3.5,
              children: [
                _buildDiagnosticItem('Port Status', 'DOWN',
                    valueColor: Colors.red[400]),
                _buildDiagnosticItem('Admin State', 'UP'),
                _buildDiagnosticItem('Optical Pwr', '-40.2 dBm',
                    valueColor: Colors.red[400]),
                _buildDiagnosticItem('Temperature', '48°C',
                    valueColor: Colors.amber[400]),
                _buildDiagnosticItem('Voltage', '0.0V'),
                _buildDiagnosticItem('Last Up', '10:00:22'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiagnosticItem(String title, String value, {Color? valueColor}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(color: Colors.grey[400], fontSize: 12)),
            Text(value,
                style: TextStyle(
                    color: valueColor ?? Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12)),
          ],
        ),
        const Spacer(),
        Divider(color: Colors.grey[800], height: 1),
      ],
    );
  }

  Widget _buildAlarmLog(Color cardColor) {
    // Dummy data for the log
    final logs = [
      {
        'title': 'Dying Gasp Alarm',
        'time': '10:00:45',
        'details': 'Critical - Power Loss Detected',
        'color': Colors.red
      },
      {
        'title': 'High Temperature Warning',
        'time': '09:55:12',
        'details': 'Warning - Threshold > 45°C',
        'color': Colors.amber
      },
      {
        'title': 'Fan Speed Warning',
        'time': '09:48:30',
        'details': 'Minor - Fan #2 RPM Low',
        'color': Colors.grey
      },
      {
        'title': 'System Heartbeat',
        'time': '09:00:00',
        'details': 'Info - Status Normal',
        'color': Colors.green
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[800]!),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(Icons.history, color: Colors.grey[400]),
                const SizedBox(width: 8),
                Text('Historical Alarm Log',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Divider(color: Colors.grey[800], height: 1),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: logs.length,
            itemBuilder: (context, index) {
              final log = logs[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Timeline circle
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: log['color'] as Color),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(log['title'] as String,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(log['time'] as String,
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 12,
                                      fontFamily: 'monospace')),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(log['details'] as String,
                              style: TextStyle(
                                  color:
                                      (log['color'] as Color).withOpacity(0.7),
                                  fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildFooter(Color backgroundColor) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.navigation),
              label: const Text('Navigate'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF161F29),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.build_circle),
              label: const Text('Initial Check'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2b8cee),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
