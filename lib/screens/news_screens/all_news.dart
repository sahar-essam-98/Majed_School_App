import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/controllers/api_controller.dart';
import 'package:school/widgets/constants.dart';

import 'news_details.dart';

class AllNews extends StatefulWidget {
  const AllNews({Key? key}) : super(key: key);

  @override
  _AllNewsState createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  var data;

  bool isloading = false;

  getnews() async {
    setState(() {
      isloading = true;
    });
    try {
      Controller().getdepartmentbyid(3).then((value) => {
        setState(() {
          isloading = false;
        }),
        if (value != null)
          {
            setState(() {
              data = value['data']['posts'];
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
    super.initState();
    getnews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(
          'أخبار',
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
                    builder: (context) => NewsDetails(
                      data: data[index],
                    ),
                  ),
                );
                //    Navigator.pushNamed(context, '/activity_details');
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                height: 250.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: Image.network(
                          'https://colorz.co.il/shcool/public/images/admin/sliders/${data[index]['image']}',
                          height: 150.h,
                          width: double.infinity.w,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          '${data[index]['name']}',
                          style: TextStyle(
                              fontFamily: 'noto',
                              fontSize: 12.sp,
                              color: mainColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          '${data[index]['text']}',
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: 'noto',
                            fontSize: 12.sp,
                            color: Colors.grey.shade600,
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