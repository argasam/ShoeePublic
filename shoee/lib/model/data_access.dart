// // lib/model/data_access.dart

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shoee/model/user.dart';

// class DataAccess {
//   final String baseUrl = 'https://my-api.com';

//   Future<User?> getUserById(String id) async {
//     final response = await http.get(Uri.parse('$baseUrl/users/$id'));
//     if (response.statusCode == 200) {
//       return User.fromJson(jsonDecode(response.body));
//     } else {
//       return null;
//     }
//   }

//   Future<void> updateUser(User user) async {
//     final response = await http.put(
//       Uri.parse('$baseUrl/users/${user.id}'),
//       body: jsonEncode(user.toJson()),
//       headers: {'Content-Type': 'application/json'},
//     );
//     if (response.statusCode != 204) {
//       throw Exception('Failed to update user.');
//     }
//   }

//   // Other methods for handling user data access.
// }
