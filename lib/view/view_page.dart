import 'package:flutter/material.dart';

import '../api_controller/get_api.dart';
import '../model/get_response.dart';

class ViewData extends StatefulWidget {
   const ViewData({super.key});

  @override
  State<ViewData> createState() => _ViewDataState();
}


class _ViewDataState extends State<ViewData> {
  ScrollController scrollController = ScrollController();
 List listData =[];

  @override
  initState(){
    apiHandler.getDataMethod();
    //listData = apiHandler.getDataMethod() as List<GetResponse>?;
    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent == scrollController.position.pixels){
        apiHandler.getDataMethod();
      }
    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Data"),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child:  Column(
          children: [
ListView.builder(
  itemCount: listData.length + 1,
shrinkWrap: true,
  physics: const BouncingScrollPhysics(),
  itemBuilder: (context, index) {
   return Center(child: Container(child: Text("$listData[index]"),));
},)
          ],
        ),
      ),
    );
  }
}
