import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:field_technician_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('verify app starts and displays home screen', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Find the title
      expect(find.text('New Ticket'), findsOneWidget);

      // Find the main prompt
      expect(find.text('What action is being performed?'), findsOneWidget);
    });
  });
}
