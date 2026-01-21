import 'package:flutter/material.dart';
import 'package:field_service_app/data/asset_model.dart';
import 'package:field_service_app/workflow/asset_migration_workflow.dart';

class AssetMigrationScreen extends StatefulWidget {
  const AssetMigrationScreen({Key? key}) : super(key: key);

  @override
  _AssetMigrationScreenState createState() => _AssetMigrationScreenState();
}

class _AssetMigrationScreenState extends State<AssetMigrationScreen> {
  final AssetMigrationWorkflow _workflow = AssetMigrationWorkflow();

  @override
  void initState() {
    super.initState();
    _workflow.loadAsset('ODP-BJS-05');
  }

  @override
  Widget build(BuildContext context) {
    final Asset? asset = _workflow.asset;
    if (asset == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF101922) : const Color(0xFFF6F7F8),
      appBar: AppBar(
        backgroundColor: isDarkMode ? const Color(0xFF101922) : const Color(0xFFF6F7F8),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          children: [
            Text(
              'Asset Migration',
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              asset.id,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Map (Simulated)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuC7C-bq_l1hJw9KKLBWIBuccoUGX03OvFFaO0x-FZimK_MB7DIg4TJuX4ik5KjQeY81a-efuY2GnXXcV5PyuatiT0XDi2k2wdOsNQcbQ47lhsvz5wJT8Q2BcWqT84AsOMU3uCDwjlHfeVrGyGL6yy6lcYrM2JYFCwFOY6ILhCBmdSZE_Ok9fcNzypPyRzT6XxBVjRNzHU33Md_6sMoNqT4r7oFCRgTTVo85rd1vigs355-KpyBYQPFi5RQMnprdj-6FTpCxGdkSqs4'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Floating Map Controls
          Positioned(
            top: 16,
            right: 16,
            child: Column(
              children: [
                FloatingActionButton(
                  mini: true,
                  onPressed: () {},
                  backgroundColor: isDarkMode ? const Color(0xFF192633) : Colors.white,
                  child: Icon(Icons.layers, color: isDarkMode ? Colors.white : Colors.black54),
                ),
                const SizedBox(height: 8),
                Column(
                  children: [
                    FloatingActionButton(
                      mini: true,
                      onPressed: () {},
                      backgroundColor: isDarkMode ? const Color(0xFF192633) : Colors.white,
                      child: Icon(Icons.add, color: isDarkMode ? Colors.white : Colors.black54),
                    ),
                    FloatingActionButton(
                      mini: true,
                      onPressed: () {},
                      backgroundColor: isDarkMode ? const Color(0xFF192633) : Colors.white,
                      child: Icon(Icons.remove, color: isDarkMode ? Colors.white : Colors.black54),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  mini: true,
                  onPressed: () {},
                  backgroundColor: isDarkMode ? const Color(0xFF192633) : Colors.white,
                  child: const Icon(Icons.near_me, color: Color(0xFF137FEC)),
                ),
              ],
            ),
          ),
          // Bottom Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.4,
            maxChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: isDarkMode ? const Color(0xFF101922) : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Handle
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Header Info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              asset.id,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              asset.address,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.router, color: Color(0xFF137FEC), size: 36),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Stats Grid
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: [
                        _buildStatCard(
                          isDarkMode,
                          'Impact',
                          '${asset.impactedCustomers} Active Cust.',
                          Icons.group,
                          Colors.orange,
                        ),
                        _buildStatCard(
                          isDarkMode,
                          'Distance',
                          '${asset.migrationDistance}m Shift Delta',
                          Icons.straighten,
                          const Color(0xFF137FEC),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Toggle
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Edit Cable Polyline',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Switch(
                          value: _workflow.isEditingPolyline,
                          onChanged: (value) {
                            setState(() {
                              _workflow.togglePolylineEditing(value);
                            });
                          },
                          activeColor: const Color(0xFF137FEC),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Action Button
                    ElevatedButton.icon(
                      onPressed: _workflow.setNewLocation,
                      icon: const Icon(Icons.pin_drop),
                      label: const Text('Set New Location'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF137FEC),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(bool isDarkMode, String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF192633) : Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDarkMode ? Colors.grey[700]! : Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
