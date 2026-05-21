import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/appBottomNav.dart';
import '../../components/cancelTaskList.dart';
import '../../components/completedTaskList.dart';
import '../../components/newTaskList.dart';
import '../../components/progressTaskList.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int TabIndex = 0;

  onItemTapped(int index) {
    setState(() {
      TabIndex = index;
    });
  }

  final widgetOptions = [
    newTaskList(),
    progressTaskList(),
    completedTaskList(),
    cancelTaskList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: widgetOptions.elementAt(TabIndex),
      bottomNavigationBar: appBottomNav(TabIndex,onItemTapped),
    );
  }
}
