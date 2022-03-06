import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/controllers/api_controller.dart';
import 'package:school/widgets/constants.dart';

import 'notification_detail.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        title: Text('الإشعارات'),
        centerTitle: true,
      ),
      body: isloading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Container(
        margin: EdgeInsets.only(top: 20),
        child: Center(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, i) => Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                onTap: () {
                  print("fff ${data[i]}");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationDetails(
                        data[i],
                      ),
                    ),
                  );
                },
                title: AutoSizeText(
                  '${data[i]['title']}',
                  maxLines: 1,
                  maxFontSize: 17.sp,
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: AutoSizeText(
                  '${data[i]['content']}',
                  maxLines: 2,
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 15.sp),
                ),
              ),
            ),
            //separatorBuilder: (BuildContext context, int index) {
            // return Divider(
            //   color: Colors.grey.shade400,
            //   indent: 8,
            //   endIndent: 8,
            //   thickness: 1,
            // );

          ),
        ),
      ),
    );
  }
}