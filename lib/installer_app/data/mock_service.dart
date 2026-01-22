import 'models/customer.dart';
import 'models/installation.dart';

class MockService {
  Customer getCustomer() {
    return Customer(
      name: 'John Doe',
      address: '123 Maple Street, Apt 4B',
      package: '1Gbps Fiber Package',
    );
  }

  Installation getInstallationDetails() {
    return Installation(
      cableLength: '145m',
      deviceType: 'ONT-Type-C',
      mappedPoints: [
        MappedPoint(
          title: 'ODP Start: ODP-JKT-001',
          timestamp: '09:00 AM',
          coordinates: '-6.2088, 106.8456',
        ),
        MappedPoint(
          title: 'Tiang 1 (Pole)',
          timestamp: '09:15 AM',
          coordinates: '-6.2090, 106.8460',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAtrAPsWJkSP0YErpf4frJbD8vAqikLoRWDK7cPFI1Usdx0lM-dpVqOvfgyLIW1pa3blGMRcoqP6LMkhk-t-kkgubY7mJl7tq6TEoxwEQut4e2vyh8ixBzjUsWPe3nyxnkNH_DJbYr2yH0Y7onOmOO-Vh5URck4spzdWtuq29Hi2ONrr7Iu7JS4dz7-UKYlSknxihUtEe9dn-y74dNcSO2d1K5bLjTe4PEjTdXGg4JZDNJVqmQtwe_QGmmDCwnRRhw2IRnFS2UtzJU',
        ),
        MappedPoint(
          title: 'Belokan (Turn)',
          timestamp: '09:20 AM',
          coordinates: '-6.2095, 106.8470',
        ),
      ],
    );
  }
}
