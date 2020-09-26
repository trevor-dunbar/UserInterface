import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:userInterface/employee_list.dart';

import 'package:userInterface/models/employee.dart';

void main() {
  testWidgets('Renders Employee Banner with an Employee ', (WidgetTester tester) async {
    HttpOverrides.global = null;
    List<Employee> mockEmployeeList = [
      Employee(
        name: "Trevor Dunbar",
        email: "Trevor@Dunbar.com",
        role: "Developer",
        skills: ["React"],
      )
    ];

    await tester.pumpWidget(MaterialApp(home: EmployeeList(mockEmployeeList)));

    expect(find.text('Employees'), findsOneWidget);
    expect(find.text('Trevor Dunbar'), findsOneWidget);
    expect(find.text('Some text'), findsNothing);
  });
}
