import 'package:flutter/material.dart';
import '../../data/mock_data.dart';
import '../../data/models/app_models.dart';

class WorkCompletionReportScreen extends StatelessWidget {
  const WorkCompletionReportScreen({Key? key}) : super(key: key);

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
            Text('Work Completion Report', style: TextStyle(fontSize: 18.0)),
            Text('Job ID: #9283-A', style: TextStyle(fontSize: 12.0)),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildWorkPerformedSection(),
          const SizedBox(height: 24.0),
          _buildMaterialInventorySection(),
          const SizedBox(height: 24.0),
          _buildFinalEvidenceSection(),
          const SizedBox(height: 24.0),
          _buildSignaturesSection(),
          const SizedBox(height: 120), // Extra padding to not be hidden by the footer
        ],
      ),
      bottomNavigationBar: _buildFooter(),
    );
  }

  Widget _buildWorkPerformedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Work Performed',
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16.0),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 1.5,
          ),
          itemCount: MockData.workPerformedItems.length,
          itemBuilder: (context, index) {
            final item = MockData.workPerformedItems[index];
            return _buildWorkPerformedCard(item);
          },
        ),
      ],
    );
  }

  Widget _buildWorkPerformedCard(WorkPerformed item) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: item.iconBackgroundColor,
              child: Icon(
                item.icon,
                color: item.iconColor,
              ),
            ),
            const Spacer(),
            Text(
              item.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                if (item.isCompleted)
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 14.0,
                  ),
                if (item.isCompleted) const SizedBox(width: 4.0),
                Text(
                  item.subtitle,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: item.isCompleted ? Colors.green : Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialInventorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Material Inventory',
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Chip(
              label: Text('${MockData.materialItems.length} Items'),
              backgroundColor: Colors.grey.shade200,
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: MockData.materialItems.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12.0),
          itemBuilder: (context, index) {
            final item = MockData.materialItems[index];
            return _buildMaterialItemCard(item);
          },
        ),
        const SizedBox(height: 16.0),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.qr_code_scanner),
          label: const Text('Scan & Add Material'),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMaterialItemCard(MaterialItem item) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              child: Icon(
                item.icon,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item.category,
                    style: const TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                item.quantity,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFinalEvidenceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Final Evidence',
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Chip(
              label: Text('${MockData.evidencePhotos.length} Photos'),
              backgroundColor: Colors.yellow.shade100,
              labelStyle: TextStyle(color: Colors.yellow.shade800),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: MockData.evidencePhotos.length + 1,
            separatorBuilder: (context, index) => const SizedBox(width: 12.0),
            itemBuilder: (context, index) {
              if (index < MockData.evidencePhotos.length) {
                final photo = MockData.evidencePhotos[index];
                return _buildEvidencePhotoCard(photo);
              } else {
                return _buildAddPhotoButton();
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEvidencePhotoCard(EvidencePhoto photo) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Stack(
        children: [
          Image.network(
            photo.imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 4,
            right: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Text(
                photo.timestamp,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8.0,
                  fontFamily: 'monospace',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddPhotoButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.grey.shade400,
            width: 2.0,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_a_photo,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 4.0),
            Text(
              'Add New',
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignaturesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Signatures',
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16.0),
        _buildSignaturePad(
          title: 'Technician Digital Signature',
          isSigned: true,
          signedBy: 'John D.',
          timestamp: 'Oct 24, 16:30',
        ),
        const SizedBox(height: 16.0),
        _buildSignaturePad(
          title: 'Customer Digital Signature',
          isSigned: false,
        ),
      ],
    );
  }

  Widget _buildSignaturePad({
    required String title,
    required bool isSigned,
    String? signedBy,
    String? timestamp,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8.0),
        if (isSigned)
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // This is a placeholder for the signature image
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Signed',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.verified, color: Colors.green, size: 16.0),
                          const SizedBox(width: 4.0),
                          Text(
                            'Signed by $signedBy',
                            style: const TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                        ],
                      ),
                      Text(
                        timestamp!,
                        style: const TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        else
          InkWell(
            onTap: () {},
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 2.0,
                  style: BorderStyle.solid,
                ),
                color: Colors.grey.shade100,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.draw, color: Colors.grey),
                  const SizedBox(height: 8.0),
                  const Text('Tap to sign', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
      ],
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'Online & Ready to Sync',
                    style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Text(
                'v2.4.1',
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.grey,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.send),
            label: const Text('Final Submit'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
