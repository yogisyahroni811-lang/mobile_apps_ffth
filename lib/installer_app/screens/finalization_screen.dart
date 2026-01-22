import 'package:flutter/material.dart';
import 'package:field_technician_app/installer_app/data/models/installation.dart';

class FinalizationScreen extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onComplete;
  final Installation installation;

  const FinalizationScreen({
    super.key,
    required this.onBack,
    required this.onComplete,
    required this.installation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
        title: Column(
          children: [
            Text('Finalization', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            Text('Step 3 of 3', style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.bodySmall?.color)),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Progress Indicators
            Row(
              children: [
                Expanded(child: LinearProgressIndicator(value: 1.0, backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest, valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor))),
                const SizedBox(width: 8),
                Expanded(child: LinearProgressIndicator(value: 1.0, backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest, valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor))),
                const SizedBox(width: 8),
                Expanded(child: LinearProgressIndicator(value: 1.0, backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest, valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor))),
              ],
            ),
            const SizedBox(height: 24),
            // Evidence Section
            _buildEvidenceSection(context),
            const SizedBox(height: 24),
            // Installation Summary
            _buildInstallationSummary(context),
            const SizedBox(height: 24),
            // Customer Signature
            _buildCustomerSignature(context),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: onComplete,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Selesaikan Instalasi', style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onPrimary)),
              const SizedBox(width: 8),
              Icon(Icons.check, size: 20, color: Theme.of(context).colorScheme.onPrimary),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEvidenceSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Evidence', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
            Chip(
              label: Text('Required'),
              backgroundColor: Theme.of(context).primaryColor,
              labelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            )
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).dividerColor, width: 2, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: Icon(Icons.add_a_photo, size: 32, color: Theme.of(context).primaryColor),
                ),
                const SizedBox(height: 16),
                const Text('Foto Tampak Rumah', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Capture the home exterior clearly', style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color)),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Take Photo'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInstallationSummary(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Installation Summary', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildSummaryCard(
          context,
          icon: Icons.straighten,
          iconColor: Colors.blueAccent,
          title: 'Est. Cable Length',
          value: installation.cableLength,
        ),
        const SizedBox(height: 12),
        _buildSummaryCard(
          context,
          icon: Icons.router,
          iconColor: Colors.purple,
          title: 'Device Type',
          value: installation.deviceType,
        ),
      ],
    );
  }

  Widget _buildSummaryCard(BuildContext context, {required IconData icon, required Color iconColor, required String title, required String value, bool isValid = true}) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: iconColor.withOpacity(0.1),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color)),
                Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const Spacer(),
            if (isValid)
              const Icon(Icons.check_circle, color: Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerSignature(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Customer Signature', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
            TextButton(onPressed: () {}, child: const Text('Clear')),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Theme.of(context).dividerColor),
          ),
          child: Center(
            child: Text('Sign Here', style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color, fontSize: 24)),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'By signing, the customer acknowledges the installation is complete and the device placement is approved.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.bodySmall?.color),
        ),
      ],
    );
  }
}
