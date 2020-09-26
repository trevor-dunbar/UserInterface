import 'package:flutter/material.dart';
import 'package:userInterface/api/mock_employee.dart';
import 'package:userInterface/homepage.dart';
import 'package:userInterface/models/employee.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<Employee>> futureEmployees;

  @override
  void initState() {
    super.initState();
    futureEmployees = EmployeeData.fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: homePage(futureEmployees));
  }
}
