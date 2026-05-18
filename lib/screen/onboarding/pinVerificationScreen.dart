import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../style/style.dart';

class pinVerificationScreen extends StatefulWidget {
  const pinVerificationScreen({super.key});

  @override
  State<pinVerificationScreen> createState() => _pinVerificationScreenState();
}

class _pinVerificationScreenState extends State<pinVerificationScreen> {
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
                Text('Pin Verification', style: Head1Text(colorDarkBlue),),
                SizedBox(height: 10,),
                Text('A 4 digit verification pin will send to your email address', style: Head6Text(colorDarkBlue),),
                SizedBox(height: 20,),
                Center(
                  child: MaterialPinField(
                    length: 4,
                    theme: AppOTPStyle(),
                    onCompleted: (pin) {
                      print('Completed: $pin');
                    },
                    onChanged: (value) {
                      print('Changed: $value');
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: ElevatedButton(
                    onPressed: (){},
                    child: SuccessButtonChild("Verify"),
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
