import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/controllers/api_controller.dart';
import 'package:school/screens/courses/course_details.dart';
import 'package:school/widgets/constants.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  var data;

  bool isloading = false;

  getallcourses() async {
    setState(() {
      isloading = true;
    });
    try {
      Controller().getallcourses().then((value) => {
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
    // TODO: implement initState
    getallcourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          'الدورات',
          style: TextStyle(fontFamily: 'noto', fontSize: 16.sp),
        ),
        centerTitle: true,
        backgroundColor: mainColor,
        elevation: 0,
      ),
      body: isloading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CourseDetails(
                          data: data[index],
                        )));
                // Navigator.pushNamed(context, '/course_details');
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.only(
                    top: 10.h, right: 20.w, left: 20.w, bottom: 7.h),
                //padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),

                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: Image.network(
                            '${data[index]['image']}',
                            width: 130.w,
                            height: 130.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                          children: [
                            AutoSizeText(
                              '${data[index]['name']}',
                              maxLines: 2,
                              style: TextStyle(
                                  fontFamily: 'noto',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              width: 110.w,
                              child: AutoSizeText(
                                '${data[index]['info']}',
                                textDirection: TextDirection.rtl,
                                maxLines: 2,
                                style: TextStyle(
                                  overflow: TextOverflow.clip,
                                  color: Colors.grey.shade600,
                                  fontFamily: 'noto',
                                  fontSize: 11.sp,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            data[index]['price'] != 0
                                ? Container()
                                : Container(
                              padding: EdgeInsets.symmetric(vertical: 2),
                              // height: 20.h,
                              width: 65.w,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Center(
                                child: Text(
                                  data[index]['price'] == 0
                                      ? 'مجاناً'
                                      : 'حالة الدورة',
                                  style: TextStyle(
                                      color: Colors.green.shade700,
                                      fontFamily: 'noto',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(top: 90.h),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register_screen');
                          },
                          child: Text(
                            'سجل الآن',
                            style: TextStyle(
                                color: mainColor,
                                fontFamily: 'noto',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}