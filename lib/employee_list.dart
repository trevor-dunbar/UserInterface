import 'package:flutter/material.dart';
import 'package:userInterface/employee_information.dart';
import 'package:userInterface/models/employee.dart';
import 'package:userInterface/styles.dart';

class EmployeeList extends StatelessWidget {
  final List<Employee> employees;
  EmployeeList(this.employees);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text("Employees", style: Styles.appBarTitleStyle)),
        body: ListView.builder(
            itemCount: this.employees.length,
            itemBuilder: _listViewItemBuilder));
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    var employee = this.employees[index];

    return ListTile(
        contentPadding: EdgeInsets.all(10.0),
        leading: _itemThumbNail(employee),
        title: _itemTitle(employee),
        onTap: () => _navigateToEmployeeInformation(context, employee));
  }

  void _navigateToEmployeeInformation(BuildContext context, Employee employee) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => EmployeeInformation(employee)));
  }

  Widget _itemThumbNail(employee) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 25),
      child: Image.network("https://devao.me/images/icons/favicon.png"),
    );
  }

  Widget _itemTitle(employee) {
    return Text(employee.name, style: Styles.subtextStyle);
  }
}



// Widget _devAOSlashes() {return Container(
  //   constraints: BoxConstraints.tightFor(width: 25, height: 50),
  //   child: Row(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     children: <Widget>[
  //     Flexible(fit: FlexFit.loose, flex: 1, child: Text("/", style: TextStyle(color: Styles.lightBlue))),
  //     Flexible(fit: FlexFit.loose, flex: 1, child: Text("/", style: TextStyle(color: Styles.darkBlue))),
  //     Flexible(fit: FlexFit.loose, flex: 1, child: Text("/", style: TextStyle(color: Styles.lightGreen))),
  //     ]));
  // }