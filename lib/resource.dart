import 'dart:convert';

import 'package:http/http.dart';
import 'package:interview_task1/user_model.dart';

class ApiCall {
  final String post =
      'http://adminapp.tech/sharefeelings/api/posts?category=12&subcategory=15';
  String re = '/result';

  Future<List<Data>> getPost() async {
    var url = Uri.parse(post + re);
    Response result = await get(url);
    print(result.body);

    Map<String, dynamic> body = jsonDecode(result.body);
    List<dynamic> newBody = body.entries.last.value;
    // print('1111111');
    // print(body.first['imgpath']);
    List<Data> data = newBody.map((e) => Data.fromMap(e)).toList();

    return data;
  }
}
