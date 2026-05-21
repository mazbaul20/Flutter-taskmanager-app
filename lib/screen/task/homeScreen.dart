import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/appBottomNav.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int bottomTabIndex = 0;

  onItemTapped(int index) {
    setState(() {
      bottomTabIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(),
      bottomNavigationBar: appBottomNav(bottomTabIndex,onItemTapped),
    );
  }
}
