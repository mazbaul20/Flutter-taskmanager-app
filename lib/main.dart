import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/screen/onboarding/emailVerificationScreen.dart';
import 'package:taskmanager/screen/onboarding/loginScreen.dart';
import 'package:taskmanager/screen/onboarding/pinVerificationScreen.dart';
import 'package:taskmanager/screen/onboarding/registrationScreen.dart';
import 'package:taskmanager/screen/onboarding/setPasswordScreen.dart';
import 'package:taskmanager/screen/onboarding/splashScreen.dart';
import 'package:taskmanager/screen/task/homeScreen.dart';
import 'package:taskmanager/utility/utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await GetUserData('token');

  if(token==null){
    runApp(MyApp("/login"));
  }else{
    runApp(MyApp("/"));
  }
}

class MyApp extends StatelessWidget{
  final String FirstRoute;
  MyApp(this.FirstRoute);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        // colorScheme: ColorScheme.fromSeed(
        //   seedColor: Colors.green.shade800,
        //   primary: Colors.green.shade800,
        // ),
      ),
      title: "Task Manager",
      // name route or navigation
      initialRoute: FirstRoute,
      // initialRoute: "/setPassword",
      routes: {
        '/': (context) => homeScreen(),
        '/login': (context) => loginScreen(),
        '/registration': (context) => registrationScreen(),
        '/emailVerification': (context) => emailVerificationScreen(),
        '/pinVerification': (context) => pinVerificationScreen(),
        '/setPassword': (context) => setPasswordScreen(),
      },
    );

  }

}

