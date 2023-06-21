import 'package:flutter/material.dart';

import '../api_controller/get_api.dart';
import '../model/get_response.dart';

// ignore: must_be_immutable
class ViewData2 extends StatefulWidget {
  int page;
   ViewData2({super.key, required this.page});

  @override
  State<ViewData2> createState() => _ViewData2State();
}

class _ViewData2State extends State<ViewData2> {
  ScrollController scrollController = ScrollController();
  late List<GetResponse>? listData =[];
  bool isNoData = false;
//  int page = 1;
  @override
  initState(){
     getData(widget.page);
    // widget.page++;
    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent == scrollController.position.pixels){
        getData(widget.page);
        widget.page++;
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
        title:  Text("View Data Page ${widget.page}"),
        actions: [
          InkWell(
            onTap: ()=>{},
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
