import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/screens/courses/register_screen.dart';
import 'package:school/widgets/constants.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';


class CourseDetails extends StatefulWidget {
  dynamic data;

  CourseDetails({this.data, Key? key}) : super(key: key);

  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {

  void _shareImageAndText() async {
    try {
      final ByteData bytes = await rootBundle.load('assets/icon.png');
      await WcFlutterShare.share(
          sharePopupTitle: 'share',
          subject: 'This is subject',
          text: 'https://apps.apple.com/us/app/مدرسة-المجد/id1618614005',
          // text: 'https://play.google.com/store/apps/details?id=com.school.app',
          fileName: 'share.png',
          mimeType: 'image/png',
          bytesOfFile: bytes.buffer.asUint8List());
    } catch (e) {
      print('error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '${widget.data['name']}',
          style: const TextStyle(fontFamily: 'noto', fontSize: 16),
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
            Container(
              margin:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: Image.network(
                        '${widget.data['image']}',
                        height: 170.h,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'وصف الدورة',
                    style:  TextStyle(
                        fontFamily: 'noto',
                        color: mainColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    padding:  EdgeInsets.all(10.h),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Container(
                          child: AutoSizeText(
                            '${widget.data['info']}',
                            style:  TextStyle(
                                fontFamily: 'noto',
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold),
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'تفاصيل الدورة',
                    style: TextStyle(
                        fontFamily: 'noto',
                        color: mainColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.all(15.w),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'بداية الدورة  :',
                              style: TextStyle(
                                  fontFamily: 'noto',
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              '${widget.data['start_course']}',
                              style: TextStyle(
                                  fontFamily: 'noto',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Text(
                              'نهاية الدورة :',
                              style: TextStyle(
                                  fontFamily: 'noto',
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              '${widget.data['end_course']}',
                              style: TextStyle(
                                  fontFamily: 'noto',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Text(
                              'عدد اللقاءات :',
                              style: TextStyle(
                                  fontFamily: 'noto',
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              '${widget.data['number_meet']} لقاء',
                              style: TextStyle(
                                  fontFamily: 'noto',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Text(
                              'عدد الساعات :',
                              style: TextStyle(
                                  fontFamily: 'noto',
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              '${widget.data['hours']} ساعة',
                              style: TextStyle(
                                  fontFamily: 'noto',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Text(
                              'عدد المقاعد  :',
                              style: TextStyle(
                                  fontFamily: 'noto',
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              '${widget.data['number_student']} مقعد',
                              style: TextStyle(
                                  fontFamily: 'noto',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Text(
                              'مكان الدورة  :',
                              style: TextStyle(
                                  fontFamily: 'noto',
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              '${widget.data['location']}',
                              style: TextStyle(
                                  fontFamily: 'noto',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(0, 45.h),
                        primary: Colors.white,
                        backgroundColor: mainColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RegisterScreen(data: widget.data)));
                        //  Navigator.pushNamed(context, '/register_screen');
                      },
                      child: Text(
                        'التسجيل في الدورة',
                        style: TextStyle(
                            fontFamily: 'noto',
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        minimumSize: const Size(0, 45),
                        primary: const Color(0xff0163BE),
                        backgroundColor: Colors.white,
                      ),
                      onPressed: _shareImageAndText,
                      child: const Text(
                        'مشاركة الدورة',
                        style: TextStyle(
                            fontFamily: 'noto',
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}