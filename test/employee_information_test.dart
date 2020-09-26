import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:userInterface/employee_information.dart';

import 'package:userInterface/models/employee.dart';

void main() {
  testWidgets('Renders an Employee with all of their information displayed ', (WidgetTester tester) async {
    HttpOverrides.global = null;
    Employee mockEmployee = 
      Employee(
        name: "Trevor Dunbar",
        email: "Trevor@Dunbar.com",
        role: "Developer",
        skills: ["React"],
      );

    await tester.pumpWidget(MaterialApp(home: EmployeeInformation(mockEmployee)));

    expect(find.text('Trevor Dunbar'), findsOneWidget);
    
    expect(find.text('Role'), findsOneWidget);
    expect(find.text('Developer'), findsOneWidget);

    expect(find.text('Skills'), findsOneWidget);
    expect(find.text('React'), findsOneWidget);

    expect(find.text('Contact'), findsOneWidget);
    expect(find.text('Trevor@Dunbar.com'), findsOneWidget);

    expect(find.text('Some text'), findsNothing);
  });
}
