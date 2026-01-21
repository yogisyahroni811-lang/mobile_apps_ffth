import 'package:flutter/material.dart';

class WorkPerformed {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconBackgroundColor;
  final Color iconColor;
  final bool isCompleted;

  WorkPerformed({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconBackgroundColor,
    required this.iconColor,
    this.isCompleted = false,
  });
}

class MaterialItem {
  final IconData icon;
  final String name;
  final String category;
  final String quantity;

  MaterialItem({
    required this.icon,
    required this.name,
    required this.category,
    required this.quantity,
  });
}

class EvidencePhoto {
  final String imageUrl;
  final String timestamp;

  EvidencePhoto({
    required this.imageUrl,
    required this.timestamp,
  });
}

class DiagnosisTile {
  final IconData icon;
  final String title;
  final String subtitle;

  DiagnosisTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

// Models for OltHardwareSwapScreen
class Port {
  final int portNumber;
  final bool isAlarm;
  final bool isActive;

  Port({required this.portNumber, this.isAlarm = false, this.isActive = false});
}

class PowerMetric {
  final String name;
  final String value;
  final bool isAlarm;

  PowerMetric({required this.name, required this.value, this.isAlarm = false});
}

class CompatibilityCheckItem {
  final String property;
  final String value;

  CompatibilityCheckItem({required this.property, required this.value});
}

class NmsStatusItem {
  final String property;
  final String value;
  final Color color;
  final bool isBold;

  NmsStatusItem({required this.property, required this.value, required this.color, this.isBold = false});
}

// Models for BackbonePopDiagnosticScreen
class PowerSourceStatus {
  final bool plnEngaged;
  final String upsStatus;

  PowerSourceStatus({required this.plnEngaged, required this.upsStatus});
}

class EnvironmentalChassisStatus {
  final String coolingStatus;
  final String chassisStatus;

  EnvironmentalChassisStatus({required this.coolingStatus, required this.chassisStatus});
}

// Models for SmartTicketScreen
class SmartTicket {
  final String ticketId;
  final String status;
  final String lastUpdate;
  final String symptom;
  final String area;
  final String systemLog;
  final String targetLocation;
  final String targetAddress;
  final String mapImageUrl;

  SmartTicket({
    required this.ticketId,
    required this.status,
    required this.lastUpdate,
    required this.symptom,
    required this.area,
    required this.systemLog,
    required this.targetLocation,
    required this.targetAddress,
    required this.mapImageUrl,
  });
}

// Models for OtdrLocatorScreen
class OtdrData {
  final String segment;
  final double distance;
  final String estimatedLocation;
  final String estimatedAddress;
  final String mapImageUrl;
  final String gpsCoordinates;
  final List<String> evidencePhotos;

  OtdrData({
    required this.segment,
    required this.distance,
    required this.estimatedLocation,
    required this.estimatedAddress,
    required this.mapImageUrl,
    required this.gpsCoordinates,
    required this.evidencePhotos,
  });
}
