import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../api/apiClient.dart';
import '../../style/style.dart';

class registrationScreen extends StatefulWidget {
  const registrationScreen({super.key});

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {
  Map<String, String> FormValues = {
    "email":"",
    "firstName":"",
    "lastName":"",
    "mobile":"",
    "password":"",
    "photo":"",
    "cpassword":"",
  };
  bool isLoading = false;
  bool _isObscure = true;
  bool _isObscureCpass = true;

  InputOnChange(MapKey, TextValue){
    setState(() {
      FormValues.update(MapKey, (value)=>TextValue);
    });
  }

  FormOnSubmit() async {
    if(FormValues['email']!.length==0){
      ErrorToast("Email is required");
    }
    else if(FormValues['firstName']!.length==0){
      ErrorToast("First Name is required");
    }
    else if(FormValues['lastName']!.length==0){
      ErrorToast("Last Name is required");
    }
    else if(FormValues['mobile']!.length==0){
      ErrorToast("Mobile is required");
    }
    else if(FormValues['password']!.length==0){
      ErrorToast("Password is required");
    }
    else if(FormValues['password']!=FormValues['cpassword']){
      ErrorToast("Confirm Password does not match!");
    }
    else{
      setState(() {isLoading = true;});
      bool res = await RegistrationRequest(FormValues);
      if(res==true){
        // Navigate to Dashboard page
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route)=>false);
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
                  Text('Join With Us', style: Head1Text(colorDarkBlue),),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("Email Address"),
                    onChanged: (TextValue){
                      InputOnChange("email",TextValue);
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("First Name"),
                    onChanged: (TextValue){
                      InputOnChange("firstName",TextValue);
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("Last Name"),
                    onChanged: (TextValue){
                      InputOnChange("lastName",TextValue);
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("Mobile"),
                    onChanged: (TextValue){
                      InputOnChange("mobile",TextValue);
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    obscureText: _isObscure,
                    decoration: AppInputDecoration("Password").copyWith(
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                    onChanged: (TextValue) {
                      InputOnChange("password", TextValue);
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("Confirm Password").copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(_isObscureCpass ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _isObscureCpass = !_isObscureCpass;
                        });
                      },
                    ),
                  ),
                    obscureText: _isObscureCpass,
                    onChanged: (TextValue){
                      InputOnChange("cpassword",TextValue);
                    },
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: ElevatedButton(
                      onPressed: (){
                        FormOnSubmit();
                      },
                      child: SuccessButtonChild("Registration"),
                      style: AppButtonStyle(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?", style: Head6Text(colorDarkBlue),),
                      SizedBox(width: 1,),
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, "/login");
                      }, child: Text("Login", style: Head6Text(colorGreen),)),
                    ],
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
