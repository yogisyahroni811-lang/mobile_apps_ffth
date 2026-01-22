import 'package:flutter/material.dart';
import 'models/app_models.dart';

class MockData {
  static final List<WorkPerformed> workPerformedItems = [
    WorkPerformed(
      icon: Icons.move_location,
      title: 'Relocation',
      subtitle: 'Completed',
      iconBackgroundColor: Colors.blue.shade50,
      iconColor: Colors.blue.shade600,
      isCompleted: true,
    ),
    WorkPerformed(
      icon: Icons.group,
      title: '12 Customers',
      subtitle: 'Migrated Successfully',
      iconBackgroundColor: Colors.purple.shade50,
      iconColor: Colors.purple.shade600,
    ),
  ];

  static final List<MaterialItem> materialItems = [
    MaterialItem(
      icon: Icons.fiber_manual_record,
      name: 'Drop Core Cable',
      category: 'Cabling',
      quantity: '150m',
    ),
    MaterialItem(
      icon: Icons.security,
      name: 'Splicing Sleeve',
      category: 'Protection',
      quantity: 'x12',
    ),
    MaterialItem(
      icon: Icons.hub,
      name: 'Passive Splitter 1:8',
      category: 'Network',
      quantity: 'x1',
    ),
  ];

  static final List<EvidencePhoto> evidencePhotos = [
    EvidencePhoto(
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAJF0Mk06mEhVOJ7bJEPdifYkxjOn_KlV_Tf_Q3afCZzXoivAplt09zE-Jz415j2tAn34faJ0Uao-noik-yzIPcdgrvHeGqjY-R-HOqWvGeOhbU9lO064Itw5tMRFL34iku2V1d5esElH9M4vVezyubMaL20ufiELLyKALnD_CSShI9UebB1dFAHESNv4Ec__xoQN8meGnO00BX9lmUctmsshxcYVNMySvvCvw3s_EOhhDEtClodrAVY_ev6Ubg88Y3YqjjxHjyrl4',
      timestamp: '14:02',
    ),
    EvidencePhoto(
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC72RC2gwzE2R6B6q6GbC0mKNcIOXeb05MURVRR2aa0TUnPYK0YzWd-ARjcZlm2OxFlvn1n---jAszfbtyaHlujUnhx93Znh1yxmreNgQzYY2OBNM3Y-JI2lSJvTZWck-D7KMVI9jXayRUNCyYs95U8zCiqmhoLqB0U5phOi2o8vq9poras9e4jUMKGHyGzmzAT4CeKDM4tcn74cDNA-eLzp23ulVI0wm8OqSxDD0_9KkcAuJrN2UWKpZ5IiMDbAjseaSjKEGEaq0o',
      timestamp: '14:15',
    ),
    EvidencePhoto(
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBJSncM3QTn9R0VlhlUBHWc7jptWU3hiLsIvmBdAo9THPA26k33C_34s__ZZNa2iF-U9mBOeh03LX79biwj8s10wIUB0mf9sQjHAeSZErHDOJjowJG0OlGXkflejyRrk0hpmCvqDNDkI-18MBNF-v4XwIDE_ss2GOK66Y13vzuAcZNIcQbjLBrzHaQIfFhZgYOP4T-PBoLrupzOnm0Dzk0PFymGE6Elkesrcz1exAo0Euh1hftoZ1ZYUrXUm6aS1Q00-YrgGWpa8Qs',
      timestamp: '14:22',
    ),
  ];

  static final List<DiagnosisTile> diagnosisTiles = [
    DiagnosisTile(
      icon: Icons.bolt,
      title: 'Hardware Power',
      subtitle: 'Power failure or fluctuation',
    ),
    DiagnosisTile(
      icon: Icons.stacked_line_chart,
      title: 'High Attenuation',
      subtitle: 'Signal loss detected',
    ),
    DiagnosisTile(
      icon: Icons.content_cut,
      title: 'Physical Cable Cut',
      subtitle: 'Severed connection',
    ),
    DiagnosisTile(
      icon: Icons.router,
      title: 'Equipment Failure',
      subtitle: 'Device malfunction',
    ),
  ];

  static final List<Port> ports = List.generate(8, (index) {
    return Port(
      portNumber: index + 1,
      isAlarm: index == 3, // Port 4
      isActive: index == 2, // Port 3
    );
  });

  static final List<PowerMetric> powerMetrics = [
    PowerMetric(name: 'Tx Power', value: '-4.2 dBm'),
    PowerMetric(name: 'Rx Power', value: '-31.5 dBm', isAlarm: true),
    PowerMetric(name: 'Bias Current', value: '12.4 mA'),
    PowerMetric(name: 'Temperature', value: '42.5°C'),
  ];

  static final List<CompatibilityCheckItem> compatibilityCheckItems = [
    CompatibilityCheckItem(property: 'Vendor', value: 'CISCO-FINISAR'),
    CompatibilityCheckItem(property: 'Wavelength', value: '1310 nm'),
    CompatibilityCheckItem(property: 'Distance', value: '10km (LR)'),
  ];

  static final List<NmsStatusItem> nmsStatusItems = [
    NmsStatusItem(property: 'Interface', value: 'GigabitEthernet0/0/4', color: Colors.white),
    NmsStatusItem(property: 'Admin State', value: 'UP', color: Colors.green),
    NmsStatusItem(property: 'Line Protocol', value: 'DOWN', color: Colors.red, isBold: true),
  ];

  static final PowerSourceStatus powerSourceStatus = PowerSourceStatus(
    plnEngaged: false,
    upsStatus: 'Running on Battery',
  );

  static final EnvironmentalChassisStatus environmentalChassisStatus = EnvironmentalChassisStatus(
    coolingStatus: 'OK',
    chassisStatus: 'DOWN',
  );

  static final SmartTicket smartTicket = SmartTicket(
    ticketId: '#TKT-8921',
    status: 'Critical',
    lastUpdate: '10m ago',
    symptom: '50 Users Offline',
    area: 'Sector 4 North',
    systemLog: 'CMD: diag --last-alarm --node ODC-01\n\n[CRITICAL] Alarm ID: #9921\nType: Dying Gasp (Power Loss)\nNode: ODC-01 Cabinet\nTimestamp: 14:02 UTC\n\n>> Recommendation: Check power supply unit.',
    targetLocation: 'ODC-01 Cabinet',
    targetAddress: '42 Industrial Pkwy, Tech District',
    mapImageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAxaZvrusrtlmBXcXR8yFfbVkqR7u5Lk407oVF6DIZY_eULkn4Mfl06jTeTOUDymrH4iZlLxNFR4ZPjQq1DkMWU9nIXRPRIR4FQdSlTJakY1XKmdau3DiCXMsMW1Q1aVZIjYEAnq4rZkdLxbSCWxKtllEadwTazPjZ-5wRgkBfzXqZRMk6Pftfoeke9pkHiLqgfk07WlygB5wgbC-QY3lh1MEodStzOLzKe4rC9jggFeuelbab-xg80AdBEsD9HGbRELu5iV-F34o0',
  );

  static final OtdrData otdrData = OtdrData(
    segment: 'DC-Central → ODC-12',
    distance: 4.560,
    estimatedLocation: 'Jl. Sudirman No. 12',
    estimatedAddress: 'Near Central Business District',
    mapImageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBcaqsMo032Ifi7elfjPQQGFnvKDxFO47f7NuTJdvcutPC8tRlPdo6fFwBGJS0wm-0EzySOevD1f-tJWGOUTYrssclArH5hyVBqZ1gGbVyICGw01vpgUhyDiBRhnnfpK_e9WDh5agBWKenLJHtf2EXhDVXrXWub8bdCiTkd2N2y3VtH49KzkZ8pTJdOUbnw_cutG8FXzxAWmhW7BscP4cQsCq-J8I1-lqbYnLbJDjMeok6TzXXHx0PtzlZEvW2qMtH9q26Tg7tD5gU',
    gpsCoordinates: '-6.2088, 106.8456',
    evidencePhotos: ['https://lh3.googleusercontent.com/aida-public/AB6AXuBhwOTNYLpmrUZQXpYOoBEgm1SZotZw6-elLfN0rgrWhl9KNK8iH8_TnXnEcUOirqjKHbGN5S4eyBKZUdruX_o_C0G5tquysBqbvdcs1pUe4H5OCTB6O0uBXnH4wK-usisnJ9BDPEen6MP2DW6voUq3TkCOwP16IQg3i6YvfvbntO_KHe4iK1RKvpQrwS0wlgJOwuX1sJwR6JiNvtECpMxvopomL-h5XgBrq0I-vv2-CrtufZUE_1eiGs1GEUctBPofCWgqp0XGAHc'],
  );
}
