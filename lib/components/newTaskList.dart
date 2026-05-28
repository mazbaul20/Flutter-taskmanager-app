import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/api/apiClient.dart';

import 'TaskList.dart';

class newTaskList extends StatefulWidget {
  const newTaskList({super.key});

  @override
  State<newTaskList> createState() => _newTaskListState();
}

class _newTaskListState extends State<newTaskList> {
  List taskList = [];
  bool isLoading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    var data = await TaskListRequest("New");
    setState(() {
      isLoading = false;
      taskList = data;
    });
  }

  DeleteItem(id) async{
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Delete !"),
            content: Text("Do you want to delete Item?"),
            actions: [
              OutlinedButton(onPressed: () async {
                Navigator.pop(context);
                setState(() {isLoading=true;});
                await TaskDeleteRequest(id);
                await CallData();
              }, child: Text("Yes")),
              OutlinedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("No"))
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? (Center(child: CircularProgressIndicator()))
        : (RefreshIndicator(
            onRefresh: () async {
              await CallData();
            },
            child: TaskList(taskList, DeleteItem),
          ));
  }
}
