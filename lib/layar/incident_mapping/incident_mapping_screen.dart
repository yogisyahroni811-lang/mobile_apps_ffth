import 'package:flutter/material.dart';

class IncidentMappingScreen extends StatelessWidget {
  const IncidentMappingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Column(
          children: [
            Text('Perbaikan LOS', style: TextStyle(fontSize: 18)),
            Text('Incident Mapping',
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Batal', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Map Image
          Image.network(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAXihjJwqE3fUJGihNqaaDDn1UnieEacyBMLpEZT7tHUj1_uGYFo9AwgtgwyYO9c7Aam5gq-EC-shIVlvlx_lZ0GcvN911WjOJbnYCGcBYvrrpX-QwTvrwrwPQaWVTiwZZ2DbQPe_jaJ421GfWOeiEHo-Dq4PKYBrAf5SLZP5x6ASB11se2J7N_jt-YFECMMGc-A4IA8G7R07XH22-9vHPZnTCDSaPRYAdixifPt_7isQ4nHybPbR7z4O3FcyQt38Hw91Mbj1wgnxE',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          // Search Bar
          const Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: SearchBar(),
          ),
          // Map Controls
          const Positioned(
            top: 100,
            right: 16,
            child: MapControls(),
          ),
          // GPS Accuracy
          const Positioned(
            bottom: 150,
            left: 16,
            child: GpsAccuracy(),
          ),
          // Action Sheet
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ActionSheet(),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Cari ID Tiang atau Jalan...',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
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
          child: const Icon(Icons.near_me),
        ),
        const SizedBox(height: 16),
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          child: const Icon(Icons.layers, color: Colors.black),
        ),
      ],
    );
  }
}

class GpsAccuracy extends StatelessWidget {
  const GpsAccuracy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.satellite_alt, color: Colors.green),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('GPS Accuracy: 3m',
                  style: TextStyle(color: Colors.white, fontSize: 12)),
              Text('Signal Strong',
                  style: TextStyle(color: Colors.grey, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}

class ActionSheet extends StatelessWidget {
  const ActionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.photo_camera),
        label: const Text('Tandai Titik Splicing'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
        ),
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapping',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: 1, // Set Mapping as the current tab
      onTap: (index) {},
    );
  }
}
