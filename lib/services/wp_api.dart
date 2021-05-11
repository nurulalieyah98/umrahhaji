import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> fetchWpPosts() async {
  // var apiURL = "https://umrahhaji.com/wp-json/wp/v2/posts?_embed";
  // final response =
  //     await http.get(apiURL, headers: {"Accept": "application/json"});
  final response = await http.get(
      Uri.https('umrahhaji.com', 'wp-json/wp/v2/posts?_embed'),
      headers: {"Accept": "application/json"});

  var convertDatatoJson = jsonDecode(response.body);
  return convertDatatoJson;
}
