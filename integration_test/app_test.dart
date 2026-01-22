import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:field_technician_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('verify app starts and displays home screen', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Find the main app title
      expect(find.text('Field Technician App'), findsOneWidget);

      // Find the button to the New Ticket screen
      expect(find.text('New Ticket (Wizard)'), findsOneWidget);

      // Verify other menu items exist
      expect(find.text('Smart Ticket'), findsOneWidget);
      expect(find.text('Work Completion Report'), findsOneWidget);
    });
  });
}
