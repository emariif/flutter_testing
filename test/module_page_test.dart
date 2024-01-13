import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/provider/done_module_provider.dart';
import 'package:flutter_testing/ui/module_page.dart';
import 'package:provider/provider.dart';

Widget createHomeScreen() => ChangeNotifierProvider<DoneModuleProvider>(
      create: (context) => DoneModuleProvider(),
      child: MaterialApp(
        home: ModulePage(),
      ),
    );
void main() {
  group('Module List Page Widget Test', () {
      testWidgets('Testing if ListView shows up', (WidgetTester tester) async {
        await tester.pumpWidget(createHomeScreen());
        expect(find.byType(ListView), findsOneWidget);
      });

      testWidgets('Test Done Button', (WidgetTester tester) async{
        await tester.pumpWidget(createHomeScreen());
        await tester.tap(find.byType(ElevatedButton).first);
        await tester.pumpAndSettle();
        expect(find.byIcon(Icons.done), findsNWidgets(2));
      });
  });
}
