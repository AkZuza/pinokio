import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  final data = {
    "content": "I want to eat breakfast and go to surgery at 10 in the morning"
  };

  final jsonData = jsonEncode(data);
  final url =
      "http://127.0.0.1:8000/greet?query=I%20want%20to%20eat%20breakfast%2C%20lunch%20and%20dinner%2C%20give%20me%20optimal%20timings";

  http.get(Uri.parse(url)).then((response) {
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print(responseData["message"]);
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  });
}
