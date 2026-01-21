import 'package:flutter/material.dart';
import '../../data/mock_data.dart';
import '../../data/models/app_models.dart';

class OtdrLocatorScreen extends StatelessWidget {
  const OtdrLocatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final otdrData = MockData.otdrData;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Column(
          children: [
            Text('OTDR Locator', style: TextStyle(fontSize: 18.0)),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.circle, color: Colors.green, size: 8.0),
                SizedBox(width: 4.0),
                Text('Online: Backbone Route 4', style: TextStyle(fontSize: 12.0, color: Colors.blue)),
              ],
            ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildDistanceCalculationSection(otdrData),
            _buildMapSection(otdrData),
            _buildGroundTruthReportSection(otdrData),
          ],
        ),
      ),
      bottomNavigationBar: _buildFooter(),
    );
  }

  Widget _buildDistanceCalculationSection(OtdrData otdrData) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Distance Calculation', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
              Text('Segment: ${otdrData.segment}', style: const TextStyle(color: Colors.grey, fontSize: 12.0)),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: otdrData.distance.toString(),
                  decoration: const InputDecoration(
                    labelText: 'OTDR Distance (KM)',
                    border: OutlineInputBorder(),
                    suffixText: 'KM',
                  ),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: () {},
                child: const Text('CALCULATE'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 56),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMapSection(OtdrData otdrData) {
    return Container(
      height: 420,
      child: Stack(
        children: [
          Image.network(
            otdrData.mapImageUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            color: Colors.grey.shade800,
            colorBlendMode: BlendMode.darken,
          ),
          const Center(
            child: Icon(Icons.show_chart, color: Colors.blue, size: 100),
          ),
          const Positioned(
            top: 200,
            left: 180,
            child: Column(
              children: [
                Icon(Icons.location_on, color: Colors.red, size: 40),
                Chip(label: Text('FAULT DETECTED')),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Estimated Location', style: TextStyle(color: Colors.blue)),
                            Text(otdrData.estimatedLocation, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                            Text(otdrData.estimatedAddress, style: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Column(
                          children: [
                            Text(otdrData.distance.toString(), style: const TextStyle(fontFamily: 'monospace', fontSize: 24.0, fontWeight: FontWeight.bold)),
                            const Text('KM from DC', style: TextStyle(color: Colors.grey, fontSize: 10.0)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.navigation),
                      label: const Text('Navigate with Maps'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                        backgroundColor: Colors.blue.shade600,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGroundTruthReportSection(OtdrData otdrData) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.verified_user, color: Colors.green),
              SizedBox(width: 8.0),
              Text('Ground Truth Report', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
            ],
          ),
          const SizedBox(height: 16.0),
          Card(
            elevation: 1.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Location Confirmation'),
                    subtitle: Text(otdrData.gpsCoordinates),
                    trailing: const Chip(
                      label: Text('Live'),
                      backgroundColor: Colors.green,
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_location),
                    label: const Text('Pin Actual Cut Location'),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 40),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          const Text('Site Evidence (Mandatory)', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          Row(
            children: [
              _buildAddPhotoButton(),
              const SizedBox(width: 8.0),
              ...otdrData.evidencePhotos.map((url) => _buildPhotoThumbnail(url)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddPhotoButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey.shade400, style: BorderStyle.solid),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_a_photo, color: Colors.grey),
            Text('Add', style: TextStyle(fontSize: 10.0, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoThumbnail(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.send),
        label: const Text('SUBMIT REPORT'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 48),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}
