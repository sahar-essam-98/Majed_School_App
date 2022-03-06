import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/controllers/api_controller.dart';
import 'package:school/widgets/constants.dart';

class NotificationDetails extends StatefulWidget {
  var data;

  NotificationDetails(this.data);

  @override
  _NotificationDetailsState createState() => _NotificationDetailsState();
}

class _NotificationDetailsState extends State<NotificationDetails> {
  var data;

  bool isloading = false;

  allnotifications() async {
    setState(() {
      isloading = true;
    });
    try {
      Controller().allnotifications().then((value) => {
        setState(() {
          isloading = false;
        }),
        if (value != null)
          {
            setState(() {
              data = value['data'];
            }),
            print("the data is $data")
          }
        else
          {}
      });
    } catch (e) {
      print(e);
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  void initState() {
    allnotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        title: Text('الإشعارات'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: 20.h,right: 30.w,left: 10.w),
            child: Column(
              children: [
                AutoSizeText(
                  '${widget.data['title']}',
                  maxLines: 1,
                  maxFontSize: 20.sp,
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15.h,),

                AutoSizeText(
                  '${widget.data['content']}',
                  maxLines: 2,
                  style:
                  TextStyle(color: Colors.grey.shade800, fontSize: 17.sp),
                ),
                // ListTile(
                //       title: AutoSizeText(
                //         '${widget.data['title']}',
                //         maxLines: 1,
                //         maxFontSize: 17.sp,
                //         style: TextStyle(
                //             color: mainColor,
                //             fontSize: 17.sp,
                //             fontWeight: FontWeight.bold),
                //       ),
                //       subtitle: AutoSizeText(
                //         '${widget.data['content']}',
                //         maxLines: 2,
                //         style: TextStyle(color: Colors.grey.shade800, fontSize: 15.sp),
                //       ),
                //     ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}