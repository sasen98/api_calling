import 'dart:convert';
import 'package:api_example/api_model.dart';
import 'package:http/http.dart' as http;

class ApiCalling {
  String url = "https://jsonplaceholder.typicode.com/posts";

  Future<List<ApiModel>> getData() async {
    List<ApiModel> list = [];

    http.Response response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      var body = response.body;
      var jsonBody = jsonDecode(body);
      jsonBody.forEach((element) {
        list.add(ApiModel.fromJson(element));
      });
      return list;
    }
    return list;
  }
}
