import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> fetchWpPosts() async {
  var url = Uri.parse(
      "https://umrahhaji.com/index.php/wp-json/wp/v2/posts?per_page=100&categories=2&order=desc&orderby=date&status=publish");

  final response = await http.get(
    url,
    headers: {"Accept": "application/json"},
  );
  var convertDatatoJson = jsonDecode(response.body);
  return convertDatatoJson;
}

Future fetchWpPostImageUrl(href) async {
  var url = Uri.parse(href);

  final response = await http.get(url, headers: {"Accept": "application/json"});
  var convertDatatoJson = jsonDecode(response.body);
  return convertDatatoJson;
}
