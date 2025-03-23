import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:estate_toolbox/main.dart'; // اطمینان حاصل کنید که مسیر درست است

void main() {
  testWidgets('Widget Test: HomePage', (WidgetTester tester) async {
    // ساخت و رندر ویجت HomePage
    await tester.pumpWidget(MaterialApp(
      home: HomePage(),
    ));

    // بررسی وجود متن "جعبه ابزار املاک" در صفحه
    expect(find.text('جعبه ابزار املاک'), findsOneWidget);

    // بررسی وجود دکمه منو
    expect(find.byIcon(Icons.menu), findsOneWidget);

    // بررسی وجود فیلد جستجو
    expect(find.byType(TextField), findsOneWidget);

    // بررسی وجود دکمه جستجو
    expect(find.byIcon(Icons.search), findsOneWidget);

    // بررسی وجود بنر
    expect(find.byType(Image), findsOneWidget);

    // بررسی وجود GridView
    expect(find.byType(GridView), findsOneWidget);

    // بررسی وجود منوی پایینی (BottomNavigationBar)
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}
