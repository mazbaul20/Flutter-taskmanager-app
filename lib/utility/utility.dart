import 'dart:typed_data';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> StoreUserData(UserData) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', UserData['token']);
  await prefs.setString('email', UserData['data']['email']);
  await prefs.setString('firstName', UserData['data']['firstName']);
  await prefs.setString('lastName', UserData['data']['lastName']);
  await prefs.setString('mobile', UserData['data']['mobile']);
  await prefs.setString('photo', UserData['data']['photo']??"");
}

Future<void> WriteEmailVerification(email) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('EmailVerification', email);
}

Future<void> WriteOTPVerification(otp) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('OTPVerification', otp);
}

Future<void> ClearVerificationData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('EmailVerification');
  await prefs.remove('OTPVerification');
}

Future<bool> RemoveToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
  return true;
}

Future<String?> GetUserData(Key) async {
  final prefs = await SharedPreferences.getInstance();
  String? mydata = prefs.getString(Key);
  return mydata;
}

ShowBase64Image(Base64String){
  UriData? data = Uri.parse(Base64String).data;
  Uint8List MyImage = data!.contentAsBytes();
  return MyImage;
}

String DefaultProfilePhoto(){
  return "data:image/jpeg;base64,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";
}