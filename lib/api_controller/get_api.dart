

import 'dart:convert';

import 'package:http/http.dart';

import '../model/get_response.dart';

class ApiHandler{
  Future<List<GetResponse>?> getDataMethod(int page) async {
   try{
     Response response =
     await get(Uri.parse('https://jsonplaceholder.typicode.com/albums?_page=${page}&_limit=10'));
     //print("@@  ${response.body} ${page.value}");
     if (response.statusCode == 200) {
       List<dynamic> res = jsonDecode(response.body); //Response type most be declared
       List<GetResponse> listData = res.map((json) => GetResponse.fromJson(json)).toList();
       return listData;
     }
   }catch (e){
     print(e);
   }
   return null;
  }
}

ApiHandler apiHandler = ApiHandler();