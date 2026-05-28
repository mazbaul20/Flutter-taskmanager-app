import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

const colorRed = Color.fromRGBO(231,28,36,1);
const colorDark = Color.fromRGBO(131,28,32,1);
const colorGreen = Color.fromRGBO(33,191,115,1);
const colorBlue = Color.fromRGBO(52,152,219,1.0);
const colorOrange = Color.fromRGBO(230,126,34,1.0);
const colorWhite = Color.fromRGBO(255,255,255,1.0);
const colorDarkBlue = Color.fromRGBO(44,62,80,1.0);
const colorLightGray = Color.fromRGBO(135, 142, 150, 1.0);
const colorLight = Color.fromRGBO(211,211,211,1.0);

SizedBox ItemSizedBox(child){
  return SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(10),
        child: child,
      ),
  );
}

MaterialPinTheme AppOTPStyle() {
  return MaterialPinTheme(
    borderColor: colorLight,
    fillColor: colorWhite,
    focusedBorderColor: colorGreen,
    focusedFillColor: colorGreen,
    filledBorderColor: colorWhite,
    filledFillColor: colorWhite,
    shape: MaterialPinShape.outlined,
    borderRadius: BorderRadius.circular(5),
    cellSize: const Size(51, 48),
    borderWidth: 0.5,
  );
}

TextStyle Head1Text(textColor){
  return TextStyle(
    color: textColor,
    fontSize: 28,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w700,
  );
}

TextStyle Head6Text(textColor){
  return TextStyle(
    color: textColor,
    fontSize: 16,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w400,
  );
}

TextStyle Head7Text(textColor){
  return TextStyle(
    color: textColor,
    fontSize: 13,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w400,
  );
}

TextStyle Head9Text(textColor){
  return TextStyle(
    color: textColor,
    fontSize: 11,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w300,
  );
}

InputDecoration AppInputDecoration(label){
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: colorGreen,width: 1),
    ),
    fillColor: colorWhite,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    enabledBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: colorWhite, width: 0.0),
    ),
    border: OutlineInputBorder(),
    labelText: label,
  );
}

DecoratedBox AppDropdownStyle(child){
  return DecoratedBox(
      decoration: BoxDecoration(
        color: colorWhite,
        border: Border.all(color: colorWhite, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: child,
      ),
  );
}

SvgPicture ScreenBackground(context) {
  return SvgPicture.asset(
    'assets/images/screen-back.svg',
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}

ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.zero,
    backgroundColor: Colors.transparent,
    foregroundColor: colorWhite,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
  );
}

ButtonStyle AppStatusButtonStyle(color){
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.zero,
    backgroundColor: color,
  );
}

TextStyle ButtonTextStyle(){
  return TextStyle(
    fontSize: 14,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w400,
  );
}

Ink SuccessButtonChild(ButtonText){
  return Ink(
    decoration: BoxDecoration(
      color: colorGreen,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(ButtonText, style: ButtonTextStyle(),),
    ),
  );
}

void SuccessToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorGreen,
      textColor: colorWhite,
      fontSize: 16.0
  );
}

void ErrorToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorRed,
      textColor: colorWhite,
      fontSize: 16.0
  );
}

StatusChild(statusText, statusColor){
  return Container(
    alignment: Alignment.center,
    child: Text(statusText, style: TextStyle(color: colorWhite, fontSize: 10, fontWeight: FontWeight.w400),),
    decoration: BoxDecoration(
      color: statusColor,
      borderRadius: BorderRadius.circular(20),
    ),
    height: 20,
    width: 60,
  );
}
