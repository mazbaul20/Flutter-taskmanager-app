import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../api/apiClient.dart';
import '../../style/style.dart';

class taskCreateScreen extends StatefulWidget {
  const taskCreateScreen({super.key});

  @override
  State<taskCreateScreen> createState() => _taskCreateScreenState();
}

class _taskCreateScreenState extends State<taskCreateScreen> {
  bool isLoading = false;
  Map<String, String> FormValues = {
    "title":"",
    "description":"",
    "status":"New"
  };

  InputOnChange(MapKey, TextValue){
    setState(() {
      FormValues[MapKey] = TextValue;
    });
  }

  FormOnSubmit() async {
    if(FormValues['title']!.length==0){
      ErrorToast("Title required");
    }
    else if(FormValues['description']!.length==0){
      ErrorToast("Description required");
    } else{
      setState(() {isLoading = true;});
      bool res = await TaskCreateRequest(FormValues);
      if(res==true){
        Navigator.pushNamedAndRemoveUntil(context, "/", (route)=>false);
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
      appBar: AppBar(
        title: Text("Create New Task"),
        backgroundColor: colorGreen,
      ),
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
                  Text('Add New Task', style: Head1Text(colorDarkBlue),),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("Title"),
                    onChanged: (TextValue){
                      InputOnChange("title",TextValue);
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("Description"),
                    onChanged: (TextValue){
                      InputOnChange("description",TextValue);
                    },
                    maxLines: 10,
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: ElevatedButton(
                      onPressed: (){
                        FormOnSubmit();
                      },
                      child: SuccessButtonChild("Create"),
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
