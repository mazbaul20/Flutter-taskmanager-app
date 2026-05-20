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

Future<String?> GetUserData(Key) async {
  final prefs = await SharedPreferences.getInstance();
  String? mydata = prefs.getString(Key);
  return mydata;
}