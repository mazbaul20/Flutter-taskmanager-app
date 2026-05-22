import 'package:flutter/cupertino.dart';

import '../api/apiClient.dart';

class cancelTaskList extends StatefulWidget {
  const cancelTaskList({super.key});

  @override
  State<cancelTaskList> createState() => _cancelTaskListState();
}

class _cancelTaskListState extends State<cancelTaskList> {
  List taskList = [];
  bool isLoading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    var data = await TaskListRequest("Cancelled");
    setState(() {
      isLoading = false;
      taskList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Cancelled"),
    );
  }
}


