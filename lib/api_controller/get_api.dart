

import 'package:http/http.dart';

import '../model/get_response.dart';

class ApiHandler{
  var page =1;
  var isLoading = false;
  var lastPage = false;
  List<GetResponse> listData =<GetResponse>[];
  Future<void> getDataMethod() async {
    Response response =
    await get(Uri.parse('https://jsonplaceholder.typicode.com/albums?_page=${page}&_limit=10'));
    //print("@@  ${response.body} ${page.value}");
    if (response.statusCode == 200) {
      var res = response.body as Iterable;
      List<GetResponse> ress = res.map((v) => GetResponse.fromJson(v)).toList();

      isLoading = true;
      if(ress.isEmpty){
        lastPage = true;
      }else {
        listData.addAll(ress);
        print(listData);
        page++;
      }
     // return ress;
    } else {
      return;
    }
  }
}

ApiHandler apiHandler = ApiHandler();