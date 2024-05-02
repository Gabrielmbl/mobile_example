class Person {
  int id;
  String username;
  String email;
  String password;

  Person({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      // 'id': id,s
      'username': username,
      'email': email,
      'pwd': password,
    };
    // if (id != null) {
    //   map['id'] = id;
    // }
    return map;
  }

  static Person fromMap(Map<String, Object?> map) {
    int id = map["id"] as int;
    String username = (map["username"] as String?)!;
    String email = (map["email"] as String?)!;
    String password = (map["pwd"] as String?)!;
    return Person(id: id, username: username, email: email, password: password);
  }
}
