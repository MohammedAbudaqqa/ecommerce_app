import 'dart:convert';

import 'package:http/http.dart';

class ApiService {
  final baseUrl = "https://fakestoreapi.com/";

  Future getBaseUrl({required String endPoint}) async {
    Uri url = Uri.parse("$baseUrl$endPoint");
    Response response = await get(url);
    var body = jsonDecode(response.body);
    return body;
  }

  Future getCategories() async {
    Uri url = Uri.parse(baseUrl + "products/categories");
    Response response = await get(url);
    var body = jsonDecode(response.body);

    return body;
  }
}
