import 'package:flutter/material.dart';
import 'package:school/widgets/constants.dart';

class OutBoardingContent extends StatelessWidget {
  final String image;
  String mainText;

  //final Color pageColor;

  OutBoardingContent({required this.image, required this.mainText});

  @override
  Widget build(BuildContext context) {
    return Column(
      // padding: EdgeInsets.symmetric(horizontal: 10)
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 350,
          width: 400,
          fit: BoxFit.fill,
        ),
        Text(
          mainText,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: mainColor,
              fontFamily: 'noto'),
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
