import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/utility.dart';

class newTaskList extends StatefulWidget {
  const newTaskList({super.key});

  @override
  State<newTaskList> createState() => _newTaskListState();
}

class _newTaskListState extends State<newTaskList> {
  String email = "";

  @override
  void initState() {
    CallUserData();
    super.initState();
  }

  CallUserData() async {
    String? e = await GetUserData("email");
    setState(() {
      email = e!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("New"),
    );;
  }
}
