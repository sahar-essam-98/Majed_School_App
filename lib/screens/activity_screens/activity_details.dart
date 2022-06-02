import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/widgets/constants.dart';

class ActivityDetails extends StatefulWidget {
  dynamic data;

  ActivityDetails({this.data, Key? key}) : super(key: key);

  @override
  _ActivityDetailsState createState() => _ActivityDetailsState();
}

class _ActivityDetailsState extends State<ActivityDetails> {
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
      body: Stack(
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
            margin: EdgeInsets.only(top: 10.h),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    children: [
                      Container(
                        height:400,
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
                          Text('رابط الفعالية', style: TextStyle(fontSize: 15, fontFamily: 'noto', fontWeight: FontWeight.w900, color: mainColor),),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 10,
                          children: [
                            Linkify(
                              text:
                              widget.data['link']==null?'':'${widget.data['link']}',
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
                          Text('وصـــف', style: TextStyle(fontSize: 15, fontFamily: 'noto', fontWeight: FontWeight.w900, color: mainColor),),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 10,
                          children: [
                            AutoSizeText(
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
          )
        ],
      ),
    );
  }
}