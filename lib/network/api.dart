
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http2/model/author';

class API{
  static const String _BASE_URL = 'https://reqres.in/api';
  static Future<Author> createAuthor(String name) async {

    final Response response = await  post('$_BASE_URL/users',
    headers:<String,String>{
      'Content-Type' : 'application/json;charset=UTF-8'
    },
    body:jsonEncode(<String,String>{
      "first_name":name,

        }),
    );
    if(response.statusCode==200){
     return Author.fromJson(json.decode(response.body));
    }else{
     throw Exception("ERROR 404 not found");
    }
  }
}