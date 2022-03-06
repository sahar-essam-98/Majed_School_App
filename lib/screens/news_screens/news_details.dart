import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/widgets/constants.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class NewsDetails extends StatefulWidget {
  dynamic data;

  NewsDetails({this.data, Key? key}) : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.data['name']}',
          style: TextStyle(fontFamily: 'noto', fontSize: 16.sp),
        ),
        centerTitle: true,
        backgroundColor: mainColor,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.w),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.network(
                        'https://colorz.co.il/shcool/public/images/admin/sliders/${widget.data['image']}',
                        // controller
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'رابط الفعالية',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w900,
                            color: mainColor),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 10,
                      children: [
                        Linkify(
                          text:
                          '${widget.data['link']}',
                          style: TextStyle(
                              fontFamily: 'noto',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'وصـــف',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w900,
                            color: mainColor),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 10,
                      children: [
                        Text(
                          '${widget.data['text']}',
                          style: TextStyle(
                              fontFamily: 'noto',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}