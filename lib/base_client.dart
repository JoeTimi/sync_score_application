import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class BaseClient {
  final String baseUrl = 'https://node-m96t.onrender.com/api';
  var client = http.Client();


  Future<String?> getTokenFromLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token'); // Fetch the token
  }

  Future<void> saveTokenToLocalStorage(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token); // Save the token
  }

  // Helper function to generate headers with optional token
  Future<Map<String, String>> _getHeaders() async {
    String? token = await getTokenFromLocalStorage();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  Future<dynamic> get(String api, {String? path}) async {
    var url = Uri.parse(path ?? (baseUrl + api));
    var headers = await _getHeaders(); // Use helper to generate headers

    try {
      var response = await client.get(url, headers: headers);
      // timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during GET request: $e');
    }
  }

  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var headers = await _getHeaders(); // Use helper to generate headers
    var jsonData = json.encode(object);

    try {
      var response = await client.post(url, headers: headers, body: jsonData);
      // timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        var errorResponse = jsonDecode(response.body);
        throw Exception(errorResponse['message']);
      }
    } catch (e) {
      throw Exception('Error during POST request: $e');
    }
  }

  Future<dynamic> put(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var headers = await _getHeaders();
    var jsonData = json.encode(object);

    try {
      var response = await client.put(url, headers: headers, body: jsonData);
      // timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'Failed to update data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during PUT request: $e');
    }
  }

  Future<dynamic> delete(String api) async {
    var url = Uri.parse(baseUrl + api);
    var headers = await _getHeaders();

    try {
      var response = await client.delete(url, headers: headers);
      // timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'Failed to delete data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during DELETE request: $e');
    }
  }
  void close() {
    client.close(); // Close the HTTP client when done
  }
}


// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class BaseClient {
//   final String baseUrl = 'https://node-m96t.onrender.com/api';
//   final http.Client client = http.Client();
//
//   Future<String?> getTokenFromLocalStorage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString('token'); // Fetch the token
//   }
//
//   Future<void> saveTokenToLocalStorage(String token) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('token', token); // Save the token
//   }
//
//   Future<Map<String, String>> _getHeaders() async {
//     String? token = await getTokenFromLocalStorage();
//     return {
//       'Content-Type': 'application/json',
//       if (token != null) 'Authorization': 'Bearer $token',
//     };
//   }
//
//   Future<dynamic> get(String api, {String? path}) async {
//     var url = Uri.parse(path ?? (baseUrl + api));
//     var headers = await _getHeaders(); // Use helper to generate headers
//
//     try {
//       var response = await client.get(url, headers: headers).timeout(Duration(seconds: 10));
//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       } else {
//         throw Exception('Failed to fetch data. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error during GET request: $e');
//     }
//   }
//
//   Future<dynamic> post(String api, dynamic object) async {
//     var url = Uri.parse(baseUrl + api);
//     var headers = await _getHeaders(); // Use helper to generate headers
//     var jsonData = json.encode(object);
//
//     try {
//       var response = await client.post(url, headers: headers, body: jsonData).timeout(Duration(seconds: 10));
//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       } else {
//         var errorResponse = jsonDecode(response.body);
//         throw Exception(errorResponse['message'] ?? 'Failed to post data.');
//       }
//     } catch (e) {
//       throw Exception('Error during POST request: $e');
//     }
//   }
//
//   Future<dynamic> put(String api, dynamic object) async {
//     var url = Uri.parse(baseUrl + api);
//     var headers = await _getHeaders();
//     var jsonData = json.encode(object);
//
//     try {
//       var response = await client.put(url, headers: headers, body: jsonData).timeout(Duration(seconds: 10));
//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       } else {
//         throw Exception('Failed to update data. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error during PUT request: $e');
//     }
//   }
//
//   Future<dynamic> delete(String api) async {
//     var url = Uri.parse(baseUrl + api);
//     var headers = await _getHeaders();
//
//     try {
//       var response = await client.delete(url, headers: headers).timeout(Duration(seconds: 10));
//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       } else {
//         throw Exception('Failed to delete data. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Error during DELETE request: $e');
//     }
//   }
//
//   void close() {
//     client.close(); // Close the HTTP client when done
//   }
// }
