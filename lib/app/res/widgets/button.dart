import 'package:flutter/material.dart';
import '../../core/values/values.dart';

class Button extends StatelessWidget {
  final height;
  final width;
  final Widget? widget;
  final VoidCallback? onPressed;

  const Button(
      {Key? key,
      this.widget,
      required this.onPressed,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.8),
              offset: const Offset(-6.0, -6.0),
              blurRadius: 16.0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(6.0, 6.0),
              blurRadius: 16.0,
            ),
          ],
          color: const Color(0xFFEFEEEE),
          borderRadius: BorderRadius.circular(30)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyles.primaryDecoration,
        child: Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: widget),
      ),
    );
  }
}

class Button2 extends StatelessWidget {
  final bool isLogin;
  final height;
  final width;
  final Widget? widget;
  final VoidCallback? onPressed;

  const Button2(
      {Key? key,
      required this.isLogin,
      this.widget,
      required this.onPressed,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.8),
              offset: const Offset(-6.0, -6.0),
              blurRadius: 16.0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(6.0, 6.0),
              blurRadius: 16.0,
            ),
          ],
          color: const Color(0xFFEFEEEE),
          borderRadius: BorderRadius.circular(15.0)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: isLogin == false
            ? ButtonStyles.decoration1
            : ButtonStyles.decoration2,
        child: Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: widget),
      ),
    );
  }
}
