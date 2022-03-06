import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final bool obscureText;
  final Color textColor;
  final String? errorText;

  AppTextField({
    required this.textEditingController,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.textColor = Colors.black,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textDirection: TextDirection.ltr,
      textCapitalization: TextCapitalization.none,
      keyboardType: textInputType,
      style: TextStyle(color: textColor),
      obscureText: obscureText,
      controller: textEditingController,
      decoration: InputDecoration(
        // counterText: '',
        // constraints: BoxConstraints(
        //   minHeight: 10,
        //   maxHeight: 40,
        // ),
        // contentPadding: EdgeInsetsDirectional.zero,
        contentPadding: EdgeInsetsDirectional.zero,

        hintMaxLines: 1,
        hintTextDirection: TextDirection.ltr,
        hintStyle: TextStyle(color: Colors.grey),

        // labelText: 'Email',
        // labelStyle: TextStyle(color: Colors.grey),
        // floatingLabelBehavior: FloatingLabelBehavior.never,

        // fillColor: Colors.orange,
        // filled: true,


        // prefixText: 'ucas_',
        // prefixStyle: TextStyle(color: Colors.orange),
        // prefix: Icon(Icons.email),


        // suffixText: '@ucas.ps',

        enabled: true,
        // disabledBorder: InputBorder.none,
        disabledBorder: getBorder(borderColor: Colors.red.shade200),
        enabledBorder: getBorder(),
        focusedBorder: getBorder(borderColor: Color(0xff0163BE)),

        // helperText: 'username@ucas.ps',
        // helperStyle: TextStyle(color: Colors.grey),
        // helperMaxLines: 1,

        errorText: errorText,
        errorMaxLines: 1,
        errorBorder: getBorder(borderColor: Colors.red),
        focusedErrorBorder: getBorder(borderColor: Colors.red.shade800),
      ),
    );
  }

  OutlineInputBorder getBorder({Color borderColor = Colors.grey}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: borderColor,
        width: 1,
      ),
    );
  }
}
