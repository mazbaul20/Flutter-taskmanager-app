import 'package:flutter/cupertino.dart';

import '../api/apiClient.dart';

class progressTaskList extends StatefulWidget {
  const progressTaskList({super.key});

  @override
  State<progressTaskList> createState() => _progressTaskListState();
}

class _progressTaskListState extends State<progressTaskList> {
  List taskList = [];
  bool isLoading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    var data = await TaskListRequest("Progress");
    setState(() {
      isLoading = false;
      taskList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Progress"),
    );;
  }
}
