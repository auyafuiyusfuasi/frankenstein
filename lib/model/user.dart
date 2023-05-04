
class User {
  final int id;
  final String username;
  //final String email;
  final int password;

  const User({
    required this.id,
    required this.username,
   // required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
     // 'email': email,
      'age': password,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, username: $username, age: $password}';
  }
}
