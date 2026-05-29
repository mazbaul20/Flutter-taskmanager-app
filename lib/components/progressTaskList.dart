import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api/apiClient.dart';
import '../style/style.dart';
import 'TaskList.dart';

class progressTaskList extends StatefulWidget {
  const progressTaskList({super.key});

  @override
  State<progressTaskList> createState() => _progressTaskListState();
}

class _progressTaskListState extends State<progressTaskList> {
  List taskList = [];
  bool isLoading = true;
  String Status = "Progress";

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

  UpdateStatus(id) async {
    setState(() {isLoading = true;});
    await TaskUpdateRequest(id,Status);
    await CallData();
    setState(() {Status = "New";});
  }

  StatusChange(id) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(30),
              height: 360,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RadioListTile(
                    title: Text("New"),
                    value: "New",
                    groupValue: Status,
                    onChanged: (value) {
                      setState(() {
                        Status = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Progress"),
                    value: "Progress",
                    groupValue: Status,
                    onChanged: (value) {
                      setState(() {
                        Status = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Completed"),
                    value: "Completed",
                    groupValue: Status,
                    onChanged: (value) {
                      setState(() {
                        Status = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Cancelled"),
                    value: "Cancelled",
                    groupValue: Status,
                    onChanged: (value) {
                      setState(() {
                        Status = value.toString();
                      });
                    },
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        await UpdateStatus(id);
                      },
                      child: SuccessButtonChild("Confirm"),
                      style: AppButtonStyle(),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
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
            child: TaskList(taskList,DeleteItem,StatusChange),
          ));
  }
}
