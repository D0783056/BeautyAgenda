class Users {
  final int id;
  final String name;
  final String email;
  final String password;

  Users({this.id, this.name, this.email,this.password});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password']
    );
  }
}
