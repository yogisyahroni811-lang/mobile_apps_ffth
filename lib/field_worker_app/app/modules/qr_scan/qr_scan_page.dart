import 'package:flutter/material.dart';

class QrScanPage extends StatelessWidget {
  const QrScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scan'),
      ),
      body: const Center(
        child: Text('QR Scan Screen'),
      ),
    );
  }
}
