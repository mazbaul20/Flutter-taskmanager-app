import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../api/apiClient.dart';
import '../../style/style.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  Map<String, String> FormValues = {"email":"","password":""};
  bool isLoading = false;

  InputOnChange(MapKey, TextValue){
    setState(() {
      FormValues.update(MapKey, (value)=>TextValue);
    });
  }

  FormOnSubmit() async {
    if(FormValues['email']!.length==0){
      ErrorToast("Email is required");
    }else if(FormValues['password']!.length==0){
      ErrorToast("Password is required");
    }else{
      setState(() {isLoading = true;});
      bool res = await LoginRequest(FormValues);
      if(res==true){
        // Navigate to Dashboard page
        Navigator.pushNamedAndRemoveUntil(context, "/newTaskList", (route)=>false);
        setState(() {isLoading = false;});
      }else{
        setState(() {isLoading = false;});
        ErrorToast("Login Failed");
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
            alignment: Alignment.center,
            child: isLoading?(Center(child: CircularProgressIndicator(),)):(SingleChildScrollView(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Get Started with', style: Head1Text(colorDarkBlue),),
                  SizedBox(height: 1,),
                  Text('Learn with Mazbaul', style: Head6Text(colorDarkBlue),),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("Email Address"),
                    onChanged: (TextValue){
                      InputOnChange("email", TextValue);
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("Password"),
                    onChanged: (TextValue){
                      InputOnChange("password", TextValue);
                    },
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: ElevatedButton(
                      onPressed: (){
                        FormOnSubmit();
                      },
                      child: SuccessButtonChild("Login"),
                      style: AppButtonStyle(),
                    ),
                  ),
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
