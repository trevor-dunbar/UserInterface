import 'package:flutter/material.dart';
import 'package:userInterface/api/mock_employee.dart';
import 'package:userInterface/employee_list.dart';
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
        home: FutureBuilder<List<Employee>>(
            future: futureEmployees,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return EmployeeList(snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }));
  }
}
