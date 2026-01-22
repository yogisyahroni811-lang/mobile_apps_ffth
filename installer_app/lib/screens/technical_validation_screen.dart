import 'package:flutter/material.dart';
import 'package:installer_app/data/models/customer.dart';

class TechnicalValidationScreen extends StatelessWidget {
  final VoidCallback onNext;
  final Customer customer;

  const TechnicalValidationScreen({
    super.key,
    required this.onNext,
    required this.customer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // This would call onBack in a real app
          },
        ),
        title: const Text('Installation Wizard'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Help',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Stepper
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Step 1 of 4', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                    Text('VALIDATION', style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: 0.25,
                  backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Customer Info Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Customer', style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color, fontSize: 12)),
                          Text(customer.name, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Theme.of(context).textTheme.bodySmall?.color, size: 18),
                              const SizedBox(width: 4),
                              Expanded(child: Text(customer.address, style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color))),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Chip(
                            label: Text(customer.package, style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 12)),
                            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.map, color: Theme.of(context).textTheme.bodySmall?.color, size: 40),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Hardware Validation Section
            Text('Hardware Validation', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Device Serial Number (SN)',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                suffixIcon: const Icon(Icons.qr_code_scanner),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Redaman (Signal Strength)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                ),
                suffixText: 'dBm',
                errorText: 'Signal too low (-29 dBm). Check connections.',
                errorStyle: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
              keyboardType: TextInputType.number,
            ),
             const SizedBox(height: 24),
            // Help Box
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.2)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, color: Theme.of(context).primaryColor, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Ensure the fiber connector is clean before measuring signal strength. Use the cleaning pen if readings are inconsistent.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
       bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: onNext,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Next Step', style: TextStyle(fontSize: 16, color: Colors.white)),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward, color: Colors.white, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
