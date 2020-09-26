class Employee {
  final String name;
  final List<String> skills;
  final String email;
  final String role;
  Employee({this.name, this.email,this.skills, this.role});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'],
      email: json['email'],
      role: json['role'],
      skills: json['skills'].split(",")
    );
  }
}