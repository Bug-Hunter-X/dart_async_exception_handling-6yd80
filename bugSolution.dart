```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataFetchException implements Exception {
  final String message;
  DataFetchException(this.message);
  @override
  String toString() => 'DataFetchException: $message';
}

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw DataFetchException('Failed to load data: ${response.statusCode} - ${response.reasonPhrase}');
    }
  } catch (e) {
    // Log the error with more context
    print('Error fetching data: $e');
    // Optionally provide a default value or handle differently based on the exception type
    if (e is DataFetchException) {
        // Handle specific DataFetchException type here
        return null; //or throw the exception again
    }
    return null; // Or rethrow or handle differently based on context
  }
}
```