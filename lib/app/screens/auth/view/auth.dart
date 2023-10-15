import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/values/sizes.dart';
import '../../../core/values/values.dart';
import '../../../res/widgets/button.dart';
import '../../../res/widgets/text_input.dart';
import '../../../core/values/constants.dart';
import '../controller/signup_controller.dart';
import '../controller/user_controller.dart';

class Auth extends StatefulWidget {
  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaKey = GlobalKey<ScaffoldState>();

  SignUpController signUpController = Get.put(SignUpController());
  UserController userController = Get.put(UserController());

  var isLogin = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      key: _scaKey,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Obx(
            () => Padding(
              padding: EdgeInsets.only(
                  top: sizeHeight * 0.02, left: 25.0, right: 25.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    topView(),
                    isLogin.value ? loginWidget() : registerWidget(),
                  ]),
            ),
          ),
        ),
      ),
      bottomNavigationBar: bottomView(),
    );
  }

  Widget topView() => Row(
        children: [
          Expanded(
            child: Row(
              children: [
                loginView(),
                AppSpaces.horizontalSpace20,
                signUpView(),
              ],
            ),
          ),
          profileView()
        ],
      );

  Widget loginView() => InkWell(
        onTap: () => isLogin.value = true,
        child: Column(
          children: [
            Text(
              Constants.LOGIN,
              style: isLogin.value == true
                  ? AppTextStyles.authSelectText
                  : AppTextStyles.authUnselectText,
            ),
            isLogin.value == true ? AppSpaces.verticalSpace5 : Container(),
            isLogin.value == true
                ? Container(
                    height: 1,
                    width: 50, // Adjust the height as needed
                    color: Colors
                        .black, // Change the color to your preferred line color
                  )
                : Container()
          ],
        ),
      );

  Widget signUpView() => InkWell(
        onTap: () => isLogin.value = false,
        child: Column(
          children: [
            Text(
              Constants.SIGNUP,
              style: isLogin.value == false
                  ? AppTextStyles.authSelectText
                  : AppTextStyles.authUnselectText,
            ),
            isLogin.value == false ? AppSpaces.verticalSpace5 : Container(),
            isLogin.value == false
                ? Container(
                    height: 2,
                    width: 50, // Adjust the height as needed
                    color: Colors
                        .black, // Change the color to your preferred line color
                  )
                : Container()
          ],
        ),
      );

  Widget profileView() => Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            color: isLogin.value == true
                ? Colors.yellowAccent.shade700
                : Colors.redAccent.shade700,
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: isLogin.value == true
                  ? const AssetImage('assets/avatar-1.png')
                  : const AssetImage('assets/dummy-img.png'),
            )),
      );

  // Register
  Widget registerWidget() => signUpController.loading.value
      ? Padding(
    padding: EdgeInsets.only(top: sizeHeight * 0.35),
        child: const SizedBox(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(
            color: Colors.black,
            strokeWidth: 2,
          ),
        ),
      )
      : Padding(
          padding: EdgeInsets.only(top: sizeHeight * 0.02),
          child: Form(
            key: _formKey,
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: [
                Row(
                  children: [
                    Text(
                      Constants.SIGNUP_HEADER1,
                      style: AppTextStyles.titleHeader2,
                    ),
                    AppSpaces.horizontalSpace5,
                    Text(
                      Constants.SIGNUP_HEADER2,
                      style: AppTextStyles.titleHeader,
                    )
                  ],
                ),
                SizedBox(
                  height: sizeHeight * 0.015,
                ),
                Text(
                  Constants.SIGNUP_DESC,
                  style: AppTextStyles.subHeader,
                ),
                SizedBox(
                  height: sizeHeight * 0.04,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormInput(
                        placeholder: "First Name",
                        keyboardType: "text",
                        controller: signUpController.fNameController.value,
                        label: "Your First Name",
                        validatorFunction: (String? val) {
                          if (val!.isEmpty == true) {
                            return Constants.FNAME_EMPTY_ERROR;
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    AppSpaces.horizontalSpace20,
                    Expanded(
                      child: TextFormInput(
                        placeholder: "Last Name",
                        keyboardType: "text",
                        controller: signUpController.lNameController.value,
                        label: "Your Last Name",
                        validatorFunction: (String? val) {
                          if (val!.isEmpty == true) {
                            return Constants.LNAME_EMPTY_ERROR;
                          } else {
                            return null;
                          }
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: sizeHeight * 0.01,
                ),
                TextFormInput(
                  placeholder: "Email",
                  keyboardType: "text",
                  controller: signUpController.emailController.value,
                  label: "Your Email",
                  validatorFunction: (String? val) {
                    if (val!.isEmpty == true) {
                      return Constants.EMAIL_EMPTY_ERROR;
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: sizeHeight * 0.01,
                ),
                Obx(
                  () => TextFormInput(
                    placeholder: "Password",
                    keyboardType: "text",
                    controller: signUpController.passwordController.value,
                    obscureText: !signUpController.obscureText.value,
                    label: "Your Password",
                    validatorFunction: (String? val) {
                      if (val!.isEmpty == true) {
                        return Constants.PASSWORD_EMPTY_ERROR;
                      } else {
                        return null;
                      }
                    },
                    showPasswordValue: () => signUpController.obscureText
                        .value = !signUpController.obscureText.value,
                  ),
                ),
                SizedBox(
                  height: sizeHeight * 0.01,
                ),
                TextFormInput(
                  placeholder: "Phone Number",
                  keyboardType: "number",
                  controller: signUpController.phoneController.value,
                  label: "Your Phone",
                  validatorFunction: (String? val) {
                    if (val!.isEmpty == true) {
                      return Constants.MOBILE_EMPTY_ERROR;
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: sizeHeight * 0.01,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormInput(
                        placeholder: "City",
                        keyboardType: "text",
                        controller: signUpController.cityController.value,
                        label: "Your City",
                        validatorFunction: (String? val) {
                          if (val!.isEmpty == true) {
                            return Constants.CITY_EMPTY_ERROR;
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    AppSpaces.horizontalSpace20,
                    Expanded(
                      child: TextFormInput(
                        placeholder: "Zip",
                        keyboardType: "text",
                        controller: signUpController.zipController.value,
                        label: "Your Zip",
                        validatorFunction: (String? val) {
                          if (val!.isEmpty == true) {
                            return Constants.ZIP_EMPTY_ERROR;
                          } else {
                            return null;
                          }
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: sizeHeight * 0.02,
                ),
                socialAuth(),
                SizedBox(
                  height: sizeHeight * 0.02,
                ),
                Text(Constants.FORGOT_PASSWORD,
                    style: AppTextStyles.normalText2),
              ],
            ),
          ),
        );

  // Login
  Widget loginWidget() => userController.loading.value
      ? Padding(
    padding: EdgeInsets.only(top: sizeHeight * 0.35),
    child: const SizedBox(
      height: 25,
      width: 25,
      child: CircularProgressIndicator(
        color: Colors.black,
        strokeWidth: 2,
      ),
    ),
  )
      : Padding(
          padding: EdgeInsets.only(top: sizeHeight * 0.08),
          child: Form(
            key: _formKey,
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: [
                Text(
                  Constants.LOGIN_HEADER,
                  style: AppTextStyles.titleHeader2,
                ),
                AppSpaces.verticalSpace10,
                Text(
                  Constants.LOGIN_SUBHEADER,
                  style: AppTextStyles.subHeader,
                ),
                SizedBox(
                  height: sizeHeight * 0.05,
                ),
                TextFormInput(
                  placeholder: "Email",
                  keyboardType: "text",
                  controller: userController.emailController.value,
                  label: "Your Email",
                  validatorFunction: (String? val) {
                    if (val!.isEmpty == true) {
                      return Constants.EMAIL_EMPTY_ERROR;
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: sizeHeight * 0.02,
                ),
                Obx(
                  () => TextFormInput(
                    placeholder: "Password",
                    keyboardType: "text",
                    controller: userController.passwordController.value,
                    obscureText: !userController.obscureText.value,
                    label: "Your Password",
                    validatorFunction: (String? val) {
                      if (val!.isEmpty == true) {
                        return Constants.PASSWORD_EMPTY_ERROR;
                      } else {
                        return null;
                      }
                    },
                    showPasswordValue: () => userController.obscureText.value =
                        !userController.obscureText.value,
                  ),
                ),
                SizedBox(
                  height: sizeHeight * 0.02,
                ),
                socialAuth(),
                SizedBox(
                  height: sizeHeight * 0.02,
                ),
                Text(Constants.FORGOT_PASSWORD,
                    style: AppTextStyles.normalText2)
              ],
            ),
          ),
        );

  Widget socialAuth() => Row(
        children: [
          facebookButton(),
          AppSpaces.horizontalSpace10,
          googleButton()
        ],
      );

  Widget googleButton() => InkWell(
        onTap: () => debugPrint('Image button tapped'),
        child: Image.asset(
          'assets/google-plus.png',
          width: 35,
          height: 35,
        ),
      );

  Widget facebookButton() => InkWell(
        onTap: () => debugPrint('Image button tapped'),
        child: Image.asset(
          'assets/facebook.png',
          width: 25,
          height: 25,
        ),
      );

  Widget bottomView() => Stack(
        alignment: Alignment.topRight,
        children: [
          Container(height: 70, color: const Color(0XFFe9e9e9)),
          Obx(() => Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Button2(
                  isLogin: isLogin.value,
                  height: 50.0,
                  width: 65.0,
                  widget: Image.asset(
                    'assets/right-arrow.png',
                    height: 100,
                    width: 100,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                    isLogin.value == true
                        ? userController.loginUser(
                            userController.emailController.value.text,
                            userController.passwordController.value.text)
                        : signUpController.registerUser(
                            signUpController.fNameController.value.text,
                            signUpController.lNameController.value.text,
                            signUpController.emailController.value.text,
                            signUpController.passwordController.value.text,
                            signUpController.phoneController.value.text,
                            signUpController.cityController.value.text,
                            signUpController.zipController.value.text);
                    }
                  },
                ),
              ))
        ],
      );
}
