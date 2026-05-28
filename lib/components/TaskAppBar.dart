import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

import '../utility/utility.dart';

AppBar TaskAppBar(context,ProfileData){
  return AppBar(
    backgroundColor: colorGreen,
    flexibleSpace: Container(
      margin: EdgeInsets.fromLTRB(10, 35, 10, 5),
      child: Row(
        children: [
          CircleAvatar(
            child: ClipOval(
              child: Image.memory(ShowBase64Image(ProfileData['photo'])),
            ),
          ),
          SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${ProfileData['firstName']} ${ProfileData['lastName']}',style: Head7Text(colorWhite)),
              Text("${ProfileData['email']}",style: Head7Text(colorWhite),),
            ],
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
          onPressed: (){
            Navigator.pushNamed(context, "/taskCreate");
          },
          icon: Icon(Icons.add_circle_outline)),
      IconButton(
          onPressed: () async {
            await RemoveToken();
            Navigator.pushNamedAndRemoveUntil(context, "/login", (route)=>false);
          },
          icon: Icon(Icons.output)
      ),
    ],
  );
}