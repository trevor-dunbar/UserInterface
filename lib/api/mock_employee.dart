import 'package:userInterface/models/employee.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class EmployeeData extends Employee {

   static Future<List<Employee>> fetchEmployees() async {
    final response = await http.get('http://localhost:8081/employees');
    
    if (response.statusCode == 200) {
      var employees = List<Employee>();
      json
          .decode(response.body)
          .forEach((employee) => employees.add(Employee.fromJson(employee)));

      return employees;
    } else {
      throw Exception('Failed to load Employee');
    }
  }
}
