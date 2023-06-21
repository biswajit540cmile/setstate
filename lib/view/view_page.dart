import 'package:flutter/material.dart';
import 'package:setstates/view/view_page2.dart';

import '../api_controller/get_api.dart';
import '../model/get_response.dart';

class ViewData extends StatefulWidget {
    const ViewData({super.key});

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  ScrollController scrollController = ScrollController();
 late List<GetResponse>? listData =[];
 bool isNoData = false;
int page = 1;
  @override
  initState(){
    getData(page);
    page++;
    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent == scrollController.position.pixels){
        getData(page);
        page++;
      }
    });
    super.initState();
  }

   getData(int page) async {
    ///Adding response to List Directly
     List<GetResponse> list = (await apiHandler.getDataMethod(page))!;
     if(list.isEmpty){
       isNoData = true;
       setState(() {
       });
     }
    listData?.addAll(list);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("View Data Page $page"),
        actions: [
          InkWell(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => ViewData2(page: page,),)),
            child: const Text("Next"),
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child:  Column(
          children: [
ListView.builder(
  itemCount: listData!.length + 1,
shrinkWrap: true,
  physics: const BouncingScrollPhysics(),
  itemBuilder: (context, index) {
    //print("$index @@@@@@@@@ ${listData!.length}");
    if(index < listData!.length){
      return Center(child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${listData?[index].userId}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("id: ${listData?[index].id}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("title: ${listData?[index].title}"),
          ),
        ],
      ));
    }else if(index == listData!.length){
      return isNoData ? const Center(child: Text("No Data Available"),): const Center(child: CircularProgressIndicator());
    }
    return null;
},)
          ],
        ),
      ),
    );
  }
}
