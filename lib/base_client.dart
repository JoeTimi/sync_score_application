import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => 'ApiException: $message';
}

class BaseClient {
  final String internalBaseUrl = 'https://node-m96t.onrender.com/api'; // Internal API base URL
  final String externalBaseUrl = 'https://apiv2.allsportsapi.com/football'; // External API base URL
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

  Future<dynamic> get(String api, {bool isExternal = false}) async {
    String baseUrl = isExternal ? externalBaseUrl : internalBaseUrl;
    var url = Uri.parse(baseUrl + api); // Create a URI from the full URL
    var headers = await _getHeaders(); // Use helper to generate headers

    try {
      var response = await client.get(url, headers: headers);
          // .timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw ApiException('Failed to fetch data. Status code: ${response.statusCode}, Response: ${response.body}');
      }
    } catch (e) {
      throw ApiException('Error during GET request: $e');
    }
  }

  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(internalBaseUrl + api); // Always use internal API for POST
    var headers = await _getHeaders();
    var jsonData = json.encode(object);

    try {
      var response = await client.post(url, headers: headers, body: jsonData).timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw ApiException('Failed to post data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw ApiException('Error during POST request: $e');
    }
  }

  Future<dynamic> put(String api, dynamic object) async {
    var url = Uri.parse(internalBaseUrl + api); // Always use internal API for PUT
    var headers = await _getHeaders();
    var jsonData = json.encode(object);

    try {
      var response = await client.put(url, headers: headers, body: jsonData).timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw ApiException('Failed to update data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw ApiException('Error during PUT request: $e');
    }
  }

  Future<dynamic> delete(String api) async {
    var url = Uri.parse(internalBaseUrl + api); // Always use internal API for DELETE
    var headers = await _getHeaders();

    try {
      var response = await client.delete(url, headers: headers).timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw ApiException('Failed to delete data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw ApiException('Error during DELETE request: $e');
    }
  }

  void close() {
    client.close(); // Close the HTTP client when done
  }
}