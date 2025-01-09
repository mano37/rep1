import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/main.dart';

void main() {
  testWidgets('App displays the correct initial UI',
      (WidgetTester tester) async {
    // 앱 로드
    await tester.pumpWidget(MyApp());

    // 특정 텍스트가 화면에 있는지 확인
    // expect(find.text('Backend Status: Unknown'), findsOneWidget);
    expect(find.text('Check Backend'), findsOneWidget);

    // 특정 버튼을 누를 수 있는지 확인
    final button = find.text('Check Backend');
    expect(button, findsOneWidget);
  });
}
