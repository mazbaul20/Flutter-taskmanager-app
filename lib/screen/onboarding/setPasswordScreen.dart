import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../api/apiClient.dart';
import '../../style/style.dart';
import '../../utility/utility.dart';

class setPasswordScreen extends StatefulWidget {
  const setPasswordScreen({super.key});

  @override
  State<setPasswordScreen> createState() => _setPasswordScreenState();
}

class _setPasswordScreenState extends State<setPasswordScreen> {
  Map<String, String> FormValues = {"email":"","OTP":"","password":"", "cpassword":""};
  bool isLoading = false;
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  @override
  void initState() {
    callStoreData();
    super.initState();
  }

  Future<void> callStoreData() async {
    String? email = await GetUserData('EmailVerification') ?? "";
    String? otp = await GetUserData('OTPVerification') ?? "";
    InputOnChange('email', email);
    InputOnChange('OTP', otp);
  }

  InputOnChange(MapKey, TextValue){
    setState(() {
      FormValues.update(MapKey, (value)=>TextValue);
    });
  }

  FormOnSubmit() async {
    if(FormValues['password']!.length==0){
      ErrorToast("Password required");
    }else if(FormValues['password']!=FormValues['cpassword']){
      ErrorToast("Confirm Password does not match");
    }else{
        setState(() {isLoading = true;});
        bool res = await SetPasswordRequest(FormValues);
        if(res==true){
          await ClearVerificationData();
          Navigator.pushNamedAndRemoveUntil(context, "/login", (route)=>false);
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
                Text('Set Password', style: Head1Text(colorDarkBlue),),
                SizedBox(height: 1,),
                Text('Minimum length password 8 characters with letter and combination', style: Head6Text(colorDarkBlue),),
                SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration("Password").copyWith(
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  }, icon: Icon(isPasswordVisible ? Icons.visibility_off : Icons.visibility)),
                ),
                  onChanged: (TextValue){
                    InputOnChange("password",TextValue);
                  },
                  obscureText: isPasswordVisible,
                ),
                SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration("Confirm Password").copyWith(
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      isConfirmPasswordVisible = !isConfirmPasswordVisible;
                    });
                  }, icon: Icon(isConfirmPasswordVisible ? Icons.visibility_off : Icons.visibility)),
                ),
                  onChanged: (TextValue){
                    InputOnChange("cpassword",TextValue);
                  },
                  obscureText: isConfirmPasswordVisible,
                ),
                SizedBox(height: 20,),
                Container(
                  child: ElevatedButton(
                    onPressed: (){
                      FormOnSubmit();
                    },
                    child: SuccessButtonChild("Confirm"),
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
