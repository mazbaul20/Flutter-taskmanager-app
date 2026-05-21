import 'package:flutter/cupertino.dart';

class progressTaskList extends StatefulWidget {
  const progressTaskList({super.key});

  @override
  State<progressTaskList> createState() => _progressTaskListState();
}

class _progressTaskListState extends State<progressTaskList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Progress"),
    );;
  }
}
