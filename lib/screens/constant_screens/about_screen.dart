import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/controllers/api_controller.dart';
import 'package:school/widgets/constants.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  var data;

  bool isloading = false;
  getnews() async {
    setState(() {
      isloading = true;
    });
    try {
      Controller().getdepartmentbyid(1).then((value) => {
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
            'من نحن',
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
            : Container(
          margin: EdgeInsets.symmetric(vertical: 25.h),
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, i) => Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.network(
                      'https://colorz.co.il/shcool/public/images/admin/sliders/${data[i]['image']}',
                      height: 180.h,
                      width: double.infinity.w,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                SizedBox(height: 15.h,),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Wrap(
                    children:[ Text(
                      '${data[i]['text']}',
                      style: TextStyle(
                        fontFamily: 'noto',
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),

                      // overflow: TextOverflow.ellipsis,
                      // maxLines: 16,
                    ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
