import 'package:flutter/material.dart';
import 'package:field_technician_app/installer_app/data/models/installation.dart';

class PathMappingScreen extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  final Installation installation;

  const PathMappingScreen({
    super.key,
    required this.onNext,
    required this.onBack,
    required this.installation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: onBack,
        ),
        title: Column(
          children: [
            Text('Step 2 of 4',
                style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).textTheme.bodySmall?.color)),
            Text('Path Mapping',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // Handle help button press
            },
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
      body: Stack(
        children: [
          // Map Background
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAt8Q89XVy8fVAzqEG1YbXZ5ARu9ci-H4yNVH9vaBCVCi595ROaohEtmW3K8dL6UVYW_t2kKLjxHMvaauXc-E3P1Tuis4ANqMPpD-rFLjOPEKSbxIY1NYRX7wZNcO01UkY5G2IjSqI6174EpmdiKCnUIgZLY0D6a7txVZOviZHogj2eWIfFN0LdczHjcr3c2EczdMSS58lBQGIGbJo4RJLMYMNq7ZQRuhi4hJxThRqCvrsbwUJSPiHyk5XDsf7fkZerzVggTC8-NG4'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Map Controls
          Positioned(
            top: 16,
            right: 16,
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.my_location, color: Colors.white),
                  style: IconButton.styleFrom(backgroundColor: Colors.black54),
                  onPressed: () {},
                ),
                const SizedBox(height: 8),
                IconButton(
                  icon: const Icon(Icons.layers, color: Colors.white),
                  style: IconButton.styleFrom(backgroundColor: Colors.black54),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Draggable Bottom Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(0),
                  children: [
                    // Handle Bar
                    Center(
                      child: Container(
                        width: 40,
                        height: 5,
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Mapped Points',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                          Chip(
                            label: Text(
                                '${installation.mappedPoints.length} Points'),
                            backgroundColor: Theme.of(context).primaryColor,
                            labelStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary),
                          )
                        ],
                      ),
                    ),
                    _buildTimeline(context, installation.mappedPoints),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: onNext,
        label: const Text('Add Point'),
        icon: const Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildTimeline(BuildContext context, List<MappedPoint> points) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: points.asMap().entries.map((entry) {
          int index = entry.key;
          MappedPoint point = entry.value;
          return TimelineItem(
            icon: _getIconForPoint(point.title),
            iconColor: _getColorForPoint(context, point.title),
            title: point.title,
            timestamp: point.timestamp,
            coordinates: point.coordinates,
            imageUrl: point.imageUrl,
            isFirst: index == 0,
            isLast: index == points.length - 1,
          );
        }).toList(),
      ),
    );
  }

  IconData _getIconForPoint(String title) {
    if (title.contains('Start')) return Icons.play_circle;
    if (title.contains('Pole')) return Icons.flag;
    if (title.contains('Turn')) return Icons.turn_right;
    return Icons.location_on;
  }

  Color _getColorForPoint(BuildContext context, String title) {
    if (title.contains('Start')) return Colors.green;
    if (title.contains('Pole')) return Theme.of(context).primaryColor;
    if (title.contains('Turn')) return Colors.orange;
    return Colors.grey;
  }
}

class TimelineItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String timestamp;
  final String coordinates;
  final String? imageUrl;
  final bool isFirst;
  final bool isLast;

  const TimelineItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.timestamp,
    required this.coordinates,
    this.imageUrl,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (!isFirst)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              CircleAvatar(
                radius: 16,
                backgroundColor: iconColor,
                child: Icon(icon, color: Colors.white, size: 18),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text(timestamp,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.color)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              size: 14,
                              color:
                                  Theme.of(context).textTheme.bodySmall?.color),
                          const SizedBox(width: 4),
                          Text(coordinates,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.color,
                                  fontFamily: 'monospace')),
                        ],
                      ),
                      if (imageUrl != null) ...[
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            imageUrl!,
                            width: 64,
                            height: 64,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
