import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/TaskAppBar.dart';
import '../../components/appBottomNav.dart';
import '../../components/cancelTaskList.dart';
import '../../components/completedTaskList.dart';
import '../../components/newTaskList.dart';
import '../../components/progressTaskList.dart';
import '../../utility/utility.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int TabIndex = 0;
  bool isLoading = true;
  Map<String,String> ProfileData = {"email":"","firstName":"","lastName":"","photo":DefaultProfilePhoto()};

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

  ReadProfileData() async {
    String? email = await GetUserData("email");
    String? firstName = await GetUserData("firstName");
    String? lastName = await GetUserData("lastName");
    String? photo = await GetUserData("photo");

    setState(() {
      ProfileData = {"email":"$email","firstName":"$firstName","lastName":"$lastName","photo":"$photo"};
      isLoading = false;
    });
  }

  @override
  void initState() {
    ReadProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskAppBar(context,ProfileData),
      body: widgetOptions.elementAt(TabIndex),
      bottomNavigationBar: appBottomNav(TabIndex,onItemTapped),
    );
  }
}
