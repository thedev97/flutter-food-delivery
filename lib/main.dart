import 'package:get/get.dart';
import 'app/res/routes/routes.dart';
import 'package:flutter/material.dart';
import 'app/core/values/constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: Constants.APP_TITLE,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        builder: EasyLoading.init(),
        getPages: AppRoutes.appRoutes()
    );
  }
}
