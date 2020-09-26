import 'package:flutter/material.dart';
import 'package:userInterface/models/employee.dart';
import 'package:userInterface/styles.dart';

class EmployeeInformation extends StatelessWidget {
  final Employee employee;
  EmployeeInformation(this.employee);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(employee.name, style: Styles.appBarTitleStyle)),
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _renderEmployee(employee))),
    );
  }

  List<Widget> _renderEmployee(Employee employee) {
    var result = List<Widget>();

    result.add(
        _createBannerImage("https://devao.me/images/white-logo.png", 140.0));

    result.add(_createTitle("Role"));
    result.add(_createSubtext(employee.role));

    result.add(_createTitle("Skills"));
    for (int i = 0; i < employee.skills.length; i++) {
      result.add(_createSubtext(employee.skills[i]));
    }

    result.add(_createTitle("Contact"));
    result.add(_createSubtext(employee.email));
    return result;
  }

  Widget _createBannerImage(String url, double height) {
    return Container(
        child: Image.network(url, fit: BoxFit.fitWidth),
        decoration: BoxDecoration(color: Colors.black));
  }

  Widget _createTitle(String title) {
    return Container(
        padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
        child: Text(title, style: Styles.headerStyle));
  }

  Widget _createSubtext(String subtext) {
    return Container(
        padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
        child: Text(subtext, style: Styles.subtextStyle));
  }
}
