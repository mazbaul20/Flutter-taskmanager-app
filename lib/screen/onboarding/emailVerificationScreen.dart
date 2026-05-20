import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../api/apiClient.dart';
import '../../style/style.dart';

class emailVerificationScreen extends StatefulWidget {
  const emailVerificationScreen({super.key});

  @override
  State<emailVerificationScreen> createState() => _emailVerificationScreenState();
}

class _emailVerificationScreenState extends State<emailVerificationScreen> {
  Map<String, String> FormValues = {"email":""};
  bool isLoading = false;

  InputOnChange(MapKey, TextValue){
    setState(() {
      FormValues.update(MapKey, (value)=>TextValue);
    });
  }

  FormOnSubmit() async {
    if(FormValues['email']!.length==0){
      ErrorToast("Email is required");
    }else{
      setState(() {isLoading = true;});
      bool res = await VerifyEmailRequest(FormValues['email']);

      if(res==true){
        // Navigate to Dashboard page
        Navigator.pushNamed(context, "/pinVerification");
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
                  Text('Your Email Address', style: Head1Text(colorDarkBlue),),
                  SizedBox(height: 1,),
                  Text('A 6 digit verification pin will send to your email address', style: Head6Text(colorDarkBlue),),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: AppInputDecoration("Email Address"),
                    onChanged: (TextValue){
                      InputOnChange("email",TextValue);
                    },
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: ElevatedButton(
                      onPressed: (){
                        FormOnSubmit();
                      },
                      child: SuccessButtonChild("Send"),
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
