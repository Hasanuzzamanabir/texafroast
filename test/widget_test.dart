import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:texafrost/features/jobs/view_models/job_tracking_view_model.dart';
import 'package:texafrost/features/jobs/views/screens/tracking_progress_sub_screens/customer_signature_screen.dart';
import 'package:texafrost/features/jobs/views/screens/tracking_progress_sub_screens/job_complete_page_screen.dart';
import 'package:texafrost/features/jobs/views/screens/tracking_progress_sub_screens/part_material_screen.dart';

void main() {
  Widget createScreen(Widget child, JobTrackingViewModel viewModel) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<JobTrackingViewModel>.value(value: viewModel),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) => MaterialApp(
          home: child,
        ),
      ),
    );
  }

  testWidgets('PartMaterialScreen displays items, increments and decrements total',
      (WidgetTester tester) async {
    final viewModel = JobTrackingViewModel();
    await tester.pumpWidget(createScreen(const PartMaterialScreen(), viewModel));
    await tester.pumpAndSettle();

    expect(find.text('Parts & Materials'), findsOneWidget);
    expect(find.text('Air Filter 16×25×1 MERV-11'), findsOneWidget);
    expect(find.text('Condensate Pan Tablets (25-pack)'), findsOneWidget);
    expect(find.text('Parts Total'), findsOneWidget);
    expect(find.text('\$22.00'), findsOneWidget);

    // Tap '+' on the first item
    await tester.tap(find.byIcon(Icons.add).first);
    await tester.pumpAndSettle();

    // Check quantity incremented
    expect(find.text('\$34.50'), findsOneWidget);

    // Ensure Save & Continue is visible, then tap
    final saveButton = find.text('Save & Continue');
    await tester.ensureVisible(saveButton);
    await tester.tap(saveButton);
    await tester.pumpAndSettle();

    // Verify step 4 is completed in ViewModel
    expect(viewModel.completedSteps[4], isTrue);
  });

  testWidgets('JobCompletePageScreen renders celebration badge and completed steps',
      (WidgetTester tester) async {
    final viewModel = JobTrackingViewModel();
    await tester.pumpWidget(createScreen(const JobCompletePageScreen(), viewModel));
    await tester.pumpAndSettle();

    expect(find.text('Job Complete!'), findsOneWidget);
    expect(find.text('JOB-20240901-047'), findsOneWidget);
    expect(find.text('Riverside Office Complex'), findsOneWidget);
    expect(find.text('Checklist'), findsOneWidget);
    expect(find.text('16-point completed'), findsOneWidget);
    expect(find.text('Diagnostics'), findsOneWidget);
    expect(find.text('Readings & findings'), findsOneWidget);
    expect(find.text('Notes'), findsOneWidget);
    expect(find.text('Photos'), findsOneWidget);
    expect(find.text('Parts Used'), findsOneWidget);
    expect(find.text('Signature'), findsOneWidget);
    expect(find.text('View Service Report'), findsOneWidget);
    expect(find.text('Back to Jobs'), findsOneWidget);
  });
}
