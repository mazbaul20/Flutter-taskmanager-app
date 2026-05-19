import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utility/utility.dart';

class newTaskListScreen extends StatefulWidget {
  const newTaskListScreen({super.key});

  @override
  State<newTaskListScreen> createState() => _newTaskListScreenState();
}

class _newTaskListScreenState extends State<newTaskListScreen> {
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
    return Scaffold(
      body: Center(
        child: Text("New Task List"),
      ),
    );
  }
}
