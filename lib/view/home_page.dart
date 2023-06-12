import 'package:flutter/material.dart';
import 'package:setstates/view/view_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("setState"),),
    body: Center(child: MaterialButton(
      child: Text("Click Me"),
      onPressed:  () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  const ViewData()),
      )
    ),),
    );
  }
}
