import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/commons.dart';
import '../../../core/remote_url.dart';
import 'package:http/http.dart' as http;
import '../../../core/values/constants.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  final getStorage = GetStorage();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  RxBool obscureText = false.obs;
  RxBool loading = false.obs;
  RxBool isLoggedIn = false.obs;

  var userData = {}.obs;

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

  Future<void> loginUser(String username, String password) async {
    try{
      loading.value = true;
      const url = RemoteURL.LOGIN_URL;
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "user_email": username,
          "user_password": password,
        }),
      );
      if (response.statusCode == 200) {
        loading.value = false;
        userData.value = json.decode(response.body);
        if (userData['status'] == true) {
          isLoggedIn.value = true;
          saveUserData();
          Get.toNamed('/home');
        } else {
          Commons.errorSnackBar(Constants.LOGIN_FAILED, Constants.FAILED_MSG);
        }
      } else {
        loading.value = false;
        throw Exception(Constants.LOGIN_FAILED);
      }
    }catch(e){
      loading.value = false;
      throw Exception(e);
    }
  }

  void saveUserData(){
    getStorage.write('isLogged', true);
    getStorage.write('usernameF',userData['user_data'][0]['user_firstname']);
    getStorage.write('usernameL',userData['user_data'][0]['user_lastname']);
    getStorage.write('userEmail',userData['user_data'][0]['user_email']);
    getStorage.write('userPhone',userData['user_data'][0]['user_phone']);
    getStorage.write('userCity',userData['user_data'][0]['user_city']);
  }
}
