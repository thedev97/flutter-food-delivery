import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  final bool isActive;
  const SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3.2),
      height: isActive ? 8 : 5,
      width: isActive ? 8 : 5,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey,
        border: isActive ?  Border.all(color: Colors.black,width: 1.0,) : Border.all(color: Colors.transparent,width: 1,),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}