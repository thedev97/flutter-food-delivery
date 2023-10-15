import 'package:lottie/lottie.dart';
import '../../core/values/sizes.dart';
import '../../core/values/values.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Home extends StatelessWidget {
  final userdata = GetStorage();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Profile',
                  style: AppTextStyles.titleHeader,
                ),
                SizedBox(
                  height: sizeHeight * 0.05,
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            color: Colors.yellowAccent.shade700,
                            child: Lottie.asset("assets/person.json",
                                height: 100, width: 100),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "In",
                              style: AppTextStyles.detailsText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${userdata.read('usernameF')}",
                                style: AppTextStyles.detailsText,
                              ),
                              AppSpaces.horizontalSpace5,
                              Text(
                                "${userdata.read('usernameL')}",
                                style: AppTextStyles.detailsText,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("${userdata.read('userEmail')}",
                              style: AppTextStyles.detailsText),
                          const Divider(
                            color: Colors.black87,
                            height: 15,
                            endIndent: 15,
                          ),
                          Text("${userdata.read('userPhone')}",
                              style: AppTextStyles.detailsText),
                          const Divider(
                            color: Colors.black87,
                            height: 15,
                            endIndent: 15,
                          ),
                          Text("${userdata.read('userCity')}",
                              style: AppTextStyles.detailsText),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
        ),
      );
}
