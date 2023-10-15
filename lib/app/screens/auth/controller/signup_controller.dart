import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/commons.dart';
import '../../../core/remote_url.dart';
import 'package:http/http.dart' as http;
import '../../../core/values/constants.dart';

class SignUpController extends GetxController {
  final fNameController = TextEditingController().obs;
  final lNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  final zipController = TextEditingController().obs;

  RxBool obscureText = false.obs;
  RxBool loading = false.obs;
  var registrationData = {}.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> registerUser(String fName, String lName, String email,
      String password, String phone, String city, String zip) async {
    try{
      loading.value = true;
      const url = RemoteURL.SIGNUP_URL;
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "user_firstname": fName,
          "user_email": email,
          "user_phone": phone,
          "user_password": password,
          "user_lastname": lName,
          "user_city": city,
          "user_zipcode": zip
        }),
      );
      if (response.statusCode == 200) {
        loading.value = false;
        registrationData.value = json.decode(response.body);
        if (registrationData['msg'] == "Already Exists") {
          Commons.errorSnackBar(
              Constants.SIGNUP_FAILED, Constants.FAILED_MSG_SIGNUP);
        } else {
          Commons.snackBar(Constants.SIGNUP_SUCCESS, Constants.MSG);
        }
      } else {
        loading.value = false;
        throw Exception(Constants.LOGIN_FAILED);
      }
    }catch(e){
      throw Exception(e);
    }
  }
}
