import 'package:flutter/material.dart';
import 'package:userInterface/employee_list.dart';
import 'package:userInterface/models/employee.dart';

FutureBuilder<List<Employee>> homePage(Future<List<Employee>> futureEmployees) {
  return FutureBuilder<List<Employee>>(
            future: futureEmployees,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return EmployeeList(snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            });
}