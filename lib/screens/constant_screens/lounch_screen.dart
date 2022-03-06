import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/controllers/api_controller.dart';
import 'package:school/widgets/constants.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {

    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/out_bording_screen');
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                  colors: [
                    Colors.white,
                    Colors.white
                  ],
                ),
              ),
              child: Container(
                height: 180.h,
                width: 180.w,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70.r),
                    // image: DecorationImage(
                    //   image: NetworkImage(
                    //     data  != null ? data['data']['info']['image'] : '',
                    //   ),
                    //   fit: BoxFit.fill, ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/icon.png', fit: BoxFit.fill,width: double.infinity,),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
