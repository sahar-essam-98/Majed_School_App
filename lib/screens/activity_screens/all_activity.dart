import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/controllers/api_controller.dart';
import 'package:school/screens/activity_screens/activity_details.dart';
import 'package:school/widgets/constants.dart';

class AllActivity extends StatefulWidget {
  const AllActivity({Key? key}) : super(key: key);

  @override
  _AllActivityState createState() => _AllActivityState();
}

class _AllActivityState extends State<AllActivity> {
  var data;

  bool isloading = false;
  getnews() async {
    setState(() {
      isloading = true;
    });
    try {
      Controller().getdepartmentbyid(2).then((value) => {
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
          'فعاليات',
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
                        builder: (context) => ActivityDetails(
                          data: data[index],
                        )));
                //    Navigator.pushNamed(context, '/activity_details');
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          'https://colorz.co.il/shcool/public/images/admin/sliders/${data[index]['image']}',
                          height: 150.h,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      SizedBox(
                        height: 5,
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
                            fontSize: 11.sp,
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