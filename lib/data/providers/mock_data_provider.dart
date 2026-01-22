import 'package:flutter/material.dart';
import '../models/relocation.dart';
import '../models/ticket_model.dart';
import '../models/map_marker.dart';
import '../models/map_path.dart';

class MockDataProvider {
  Relocation getRelocation() {
    return Relocation(
      id: '#REL-2938',
      customerName: 'Sarah Jenkins',
      address: 'Apartment 4B, 123 Maple Street, Springfield',
      devices: [
        Device(
          id: '1',
          name: 'ONT Device (Modem)',
          description: 'Capture serial number label',
          status: DeviceStatus.pending,
        ),
        Device(
          id: '2',
          name: 'Power Adaptor',
          description: 'Include cable in shot',
          serialNumber: 'SN-ADPT-99283-X',
          status: DeviceStatus.verified,
          photoPath:
              'https://lh3.googleusercontent.com/aida-public/AB6AXuCLbVbiphmahjXVnSZBCYg636ETWL_KSXW3cd4LHQVEL97f9kcDwHvsffg6eDO4U7_RL1pjhiF7y7Fr4cUTos3xbqLyTEPqotL_SIYXkf5PWbDV_GuX6FD7M7I8hqv-dfpn8aprqX7pWcEm76eI0FhKcDnPbI50sB2ug7LF0ccAwbEjXyQ3kRm4-C7yCmn7IRV2x2dDhdeKtLgZUhd57VLmHbrm2467w7S9nLs8CQGrD8w7yJsqxk8I7MqzDZi1M6d9qZjonYBM5hA',
        ),
        Device(
          id: '3',
          name: 'Set Top Box (STB)',
          description: 'Capture top-down view',
          status: DeviceStatus.pending,
        ),
      ],
    );
  }

  List<Ticket> getTickets() {
    return [
      Ticket(
        id: '1',
        type: TicketType.gantiOnt,
        description: 'Hardware replacement',
        title: 'Ganti Hardware ONT',
        timeAgo: '2h ago',
        priority: TicketPriority.high,
        icon: Icons.router,
        location: 'Jl. Merdeka No. 10',
        category: 'Hardware',
      ),
      Ticket(
        id: '2',
        type: TicketType.pindahOdp,
        description: 'Re-stringing or port move',
        title: 'Pindah ODP',
        timeAgo: '5h ago',
        priority: TicketPriority.normal,
        icon: Icons.settings_input_composite,
        location: 'Jl. Sudirman No. 25',
        category: 'Network',
      ),
      Ticket(
        id: '3',
        type: TicketType.pindahRumah,
        description: 'Relocation service',
        title: 'Relokasi Rumah',
        timeAgo: '1d ago',
        priority: TicketPriority.normal,
        icon: Icons.home,
        location: 'Jl. Ahmad Yani No. 5',
        category: 'Relocation',
      ),
      Ticket(
        id: '4',
        type: TicketType.perbaikanLos,
        description: 'Loss of Signal repair',
        title: 'Perbaikan LOS',
        timeAgo: '30m ago',
        priority: TicketPriority.critical,
        icon: Icons.signal_wifi_off,
        location: 'Jl. Diponegoro No. 12',
        category: 'Repair',
      ),
    ];
  }

  List<MapMarker> getMapMarkers() {
    return [
      MapMarker(
          id: '1',
          position: Offset(170, 280),
          label: 'Titik Putus',
          icon: Icons.location_on),
      MapMarker(
          id: '2',
          position: Offset(100, 350),
          label: 'User Location',
          icon: Icons.my_location),
    ];
  }

  List<MapPath> getMapPaths() {
    return [
      MapPath(
        id: '1',
        points: [
          Offset(100, 600),
          Offset(150, 450),
          Offset(180, 350),
          Offset(300, 200),
          Offset(350, 100),
        ],
        color: Colors.grey,
        isDashed: true,
      ),
      MapPath(
        id: '2',
        points: [
          Offset(100, 600),
          Offset(160, 500),
          Offset(220, 480),
          Offset(280, 400),
        ],
        color: Color(0xFF137fec),
      ),
    ];
  }
}
