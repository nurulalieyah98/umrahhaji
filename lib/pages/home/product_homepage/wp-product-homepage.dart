import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> fetchWpPostsProduct() async {
  var url = Uri.parse(
      "https://umrahhaji.com/index.php/wp-json/wp/v2/product?per_page=4&orderby=date&status=publish");

  final response = await http.get(
    url,
    headers: {"Accept": "application/json"},
  );
  var convertDatatoJson = jsonDecode(response.body);
  return convertDatatoJson;
}

Future fetchWpPostImageUrlProduct(href) async {
  var url = Uri.parse(href);

  final response = await http.get(url, headers: {"Accept": "application/json"});
  var convertDatatoJson = jsonDecode(response.body);
  return convertDatatoJson;
}
