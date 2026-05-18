import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/style.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Get Started with', style: Head1Text(colorDarkBlue),),
                SizedBox(height: 1,),
                Text('Learn with Mazbaul', style: Head6Text(colorDarkBlue),),
                SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration("Email Address"),),
                SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration("Password"),),
                SizedBox(height: 20,),
                Container(
                  child: ElevatedButton(
                    onPressed: (){},
                    child: SuccessButtonChild("Login"),
                    style: AppButtonStyle(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
