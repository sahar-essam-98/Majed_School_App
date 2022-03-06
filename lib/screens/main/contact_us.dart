import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:school/controllers/api_controller.dart';
import 'package:school/widgets/constants.dart';
import 'package:school/widgets/text_app_field.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late TextEditingController _nameTextEditingController;
  late TextEditingController _emailTextEditingController;
  late TextEditingController _mobileTextEditingController;
  late TextEditingController _messageTextEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextEditingController = TextEditingController();
    _emailTextEditingController = TextEditingController();
    _mobileTextEditingController = TextEditingController();
    _messageTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _nameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _mobileTextEditingController.dispose();
    _messageTextEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'اتصل بنا',
          style: TextStyle(fontFamily: 'noto', fontSize: 16.sp),
        ),
        centerTitle: true,
        backgroundColor: mainColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 110.h,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.zero,
                  topLeft: Radius.zero,
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Container(
                padding: EdgeInsets.all(10.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'الاسم',
                      style: TextStyle(
                          fontFamily: 'noto',
                          fontSize: 12.sp,
                          color: mainColor),
                    ),
                    AppTextField(
                      textEditingController: _nameTextEditingController,

                      textInputType: TextInputType.emailAddress,
                      //errorText: _nameErrorText,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'البريد الالكتروني',
                      style: TextStyle(
                          fontFamily: 'noto',
                          fontSize: 12.sp,
                          color: mainColor),
                    ),
                    AppTextField(
                      textEditingController: _emailTextEditingController,

                      textInputType: TextInputType.emailAddress,
                      //errorText: _nameErrorText,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'رقم الجوال',
                      style: TextStyle(
                          fontFamily: 'noto',
                          fontSize: 12.sp,
                          color: mainColor),
                    ),
                    AppTextField(
                      textEditingController: _mobileTextEditingController,

                      textInputType: TextInputType.emailAddress,
                      //errorText: _nameErrorText,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'التفاصيل',
                      style: TextStyle(
                          fontFamily: 'noto',
                          fontSize: 12.sp,
                          color: mainColor),
                    ),
                    TextField(
                      controller: _messageTextEditingController,
                      style: TextStyle(fontSize: 20.sp),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5.w),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      minLines: 6,
                      //Normal textInputField will be displayed
                      maxLines: 9,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    isloading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                minimumSize: Size(0, 50.h),
                                primary: Colors.white,
                                backgroundColor: mainColor,
                              ),
                              onPressed: () async {
                                setState(() {
                                  isloading = true;
                                });
                                await Controller().contactus(
                                    email: _emailTextEditingController.text,
                                    name: _nameTextEditingController.text,
                                    phone: _mobileTextEditingController.text,
                                    text: _messageTextEditingController.text);
                                setState(
                                  () {
                                    isloading = false;
                                  },
                                );
                                Fluttertoast.showToast(
                                    msg: 'your complain has been recieved');
                                //    Navigator.pushNamed(context, '/register_screen');
                              },
                              child: Text(
                                'إرسال',
                                style: TextStyle(
                                    fontFamily: 'noto',
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
