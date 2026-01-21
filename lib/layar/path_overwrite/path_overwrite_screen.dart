import 'package:flutter/material.dart';

class PathOverwriteScreen extends StatelessWidget {
  const PathOverwriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Re-stringing: ODP-JKT-042'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Save', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Map Image
          Image.network(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuCna15vLXUQ89CKARCLNn4NwlTFpLeD0j7TLGEIxCC1XryLD57pVlDvIumvUCXi10uoeDs1Cdq_ELdptaVhhqOos1GmBn9irUqqjwrwnAZFBuHmnnW_Xt5V1xEb8h3Es3jyhQb9AqI3Vu9yQqQ7nuOB5tx4MDSg5LIsGscrwBn_jxxbPsKYnLy9l3cAocuiN8-ZnaP4k0ibe8NEDgW3ExIZyMdCJSOYIwTB2hAUeiCj2FYN0S9_SiuqY-vrp9jZSZwTu5m2g0CpX6Y',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          // Warning Banner
          const Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: WarningBanner(),
          ),
          // Map Controls
          const Positioned(
            top: 150,
            right: 16,
            child: MapControls(),
          ),
          // Bottom Controls
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomControls(),
          ),
        ],
      ),
    );
  }
}

class WarningBanner extends StatelessWidget {
  const WarningBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const Icon(Icons.warning, color: Colors.amber),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Warning: Overwrite Mode',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(
                      'Old path data will be archived upon saving this new route.',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.grey),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class MapControls extends StatelessWidget {
  const MapControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          onPressed: () {},
          mini: true,
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          onPressed: () {},
          mini: true,
          child: const Icon(Icons.remove),
        ),
        const SizedBox(height: 16),
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.my_location),
        ),
      ],
    );
  }
}

class BottomControls extends StatelessWidget {
  const BottomControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black.withOpacity(0.8),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatCard(icon: Icons.straighten, label: 'Total Dist.', value: '145m'),
              StatCard(icon: Icons.place, label: 'Points', value: '4'),
              StatCard(icon: Icons.hub, label: 'ODP ID', value: 'JKT-042'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              SizedBox(
                width: 64,
                height: 64,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.grey[800],
                  child: const Icon(Icons.undo),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add_location_alt),
                  label: const Text('Tambah Tumpuan'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 64),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const StatCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        Text(value,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
