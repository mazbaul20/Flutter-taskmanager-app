import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../api/apiClient.dart';
import '../../style/style.dart';
import '../../utility/utility.dart';

class pinVerificationScreen extends StatefulWidget {
  const pinVerificationScreen({super.key});

  @override
  State<pinVerificationScreen> createState() => _pinVerificationScreenState();
}

class _pinVerificationScreenState extends State<pinVerificationScreen> {
  Map<String, String> FormValues = {"otp":""};
  bool isLoading = false;

  InputOnChange(MapKey, TextValue){
    setState(() {
      FormValues.update(MapKey, (value)=>TextValue);
    });
  }

  FormOnSubmit() async {
    if(FormValues['otp']!.length==0){
      ErrorToast("PIN required");
    }else{
      setState(() {isLoading = true;});
      String? email = await GetUserData('EmailVerification');
      bool res = await VerifyOTPRequest(email, FormValues['otp']);

      if(res==true){
        Navigator.pushNamed(context, "/setPassword");
      }else{
        setState(() {isLoading = false;});
      }
    }
  }

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
                Text('A 6 digit verification pin will send to your email address', style: Head6Text(colorDarkBlue),),
                SizedBox(height: 20,),
                Center(
                  child: MaterialPinField(
                    length: 6,
                    theme: AppOTPStyle(),
                    onCompleted: (pin) {
                      print('Completed: $pin');
                    },
                    onChanged: (TextValue) {
                      InputOnChange("otp",TextValue);
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: ElevatedButton(
                    onPressed: (){
                      FormOnSubmit();
                    },
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
