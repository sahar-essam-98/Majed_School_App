// child: SingleChildScrollView(
//   child: Stack(
//     children: [
//     Container(
//     width: double.infinity,
//     height: 110.h,
//     decoration: BoxDecoration(
//       color: mainColor,
//       borderRadius: BorderRadius.only(
//         topRight: Radius.zero,
//         topLeft: Radius.zero,
//         bottomRight: Radius.circular(15),
//         bottomLeft: Radius.circular(15),
//       ),
//     ),
//   ),
//   Container(
//     child: Column(

import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:school/controllers/api_controller.dart';
import 'package:school/screens/activity_screens/activity_details.dart';
import 'package:school/screens/courses/course_details.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:school/screens/news_screens/all_news.dart';
import 'package:school/widgets/constants.dart';
import 'package:fancy_drawer/fancy_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late FancyDrawerController _controller;

  @override
  void initState() {
    super.initState();
    gethome();
    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var data;
  var infoData;
  var adds;

  bool isloading = false;

  gethome() async {
    setState(() {
      isloading = true;
    });
    try {
      Controller().gethome().then((value) async => {
            if (value != null)
              {
                setState(() {
                  data = value;
                }),
                await getdepartment(),
                await getInfo(),
                await getadds(),
                setState(() {
                  isloading = false;
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

  var posts;

  getdepartment() async {
    try {
      await Controller().getdepartment().then((value) => {
            if (value != null)
              {
                setState(() {
                  posts = value;
                }),
                print("the posts data is ${posts}")
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

  getInfo() async {
    try {
      await Controller().infoApp().then((value) => {
            if (value != null)
              {
                setState(() {
                  infoData = value;
                }),
                print("the info data is ${infoData['data']['info']['image']}")
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

  getadds() async {
    try {
      await Controller().alladds().then((value) => {
            if (value != null)
              {
                setState(() {
                  adds = value;
                }),
                print("the adds data is ${adds['data']['adds']}")
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

  bool isloading2 = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: FancyDrawerWrapper(
      hideOnContentTap: true,
      backgroundColor: Colors.white,
      controller: _controller,
      drawerItems: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width - 200),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/main_screen');
            },
            leading: FaIcon(
              FontAwesomeIcons.home,
              color: mainColor,
            ),
            title: Text(
              'الرئيسية',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'noto',
                fontSize: 14.sp,
                color: mainColor,
              ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width - 200),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/course_screen');
            },
            leading: FaIcon(
              FontAwesomeIcons.graduationCap,
              color: mainColor,
            ),
            title: Text(
              'الدورات',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'noto',
                fontSize: 14.sp,
                color: mainColor,
              ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width - 200),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/photo_screen');
            },
            leading: FaIcon(
              FontAwesomeIcons.image,
              color: mainColor,
            ),
            title: Text(
              'الصور',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'noto',
                fontSize: 14.sp,
                color: mainColor,
              ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width - 200),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/video_screen');
            },
            leading: FaIcon(
              FontAwesomeIcons.video,
              color: mainColor,
            ),
            title: Text(
              'الفيديو',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'noto',
                fontSize: 14.sp,
                color: mainColor,
              ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width - 200),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/about_screen');
            },
            leading: FaIcon(
              FontAwesomeIcons.infoCircle,
              color: mainColor,
            ),
            title: Text(
              'من نحن',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'noto',
                fontSize: 14.sp,
                color: mainColor,
              ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width - 200),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/all_activities');
            },
            leading: FaIcon(
              FontAwesomeIcons.newspaper,
              color: mainColor,
            ),
            title: Text(
              'فعاليات',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'noto',
                fontSize: 14.sp,
                color: mainColor,
              ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width - 200),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllNews(),
                ),
              );
              //   Navigator.pushNamed(context, '/lastest_activities');
            },
            leading: FaIcon(
              FontAwesomeIcons.calendar,
              color: mainColor,
            ),
            title: Text(
              'أخبار',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'noto',
                fontSize: 14.sp,
                color: mainColor,
              ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width - 200),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/contact_screen');
            },
            leading: FaIcon(
              FontAwesomeIcons.phone,
              color: mainColor,
            ),
            title: Text(
              'اتصل بنا',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'noto',
                fontSize: 14.sp,
                color: mainColor,
              ),
            ),
          ),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'الرئيسية',
            style: TextStyle(fontFamily: 'noto', fontSize: 16.sp),
          ),
          centerTitle: true,
          backgroundColor: mainColor,
          leading: IconButton(
            icon: Icon(
              Icons.menu_open,
              color: Colors.white,
            ),
            onPressed: () {
              _controller.toggle();
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/notification_screen');
              },
              icon: Icon(
                Icons.notifications_active,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: isloading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ModalProgressHUD(
                inAsyncCall: isloading2,
                progressIndicator: CircularProgressIndicator(),
                child: SingleChildScrollView(
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
                        margin: EdgeInsets.only(top: 30.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: CarouselSlider.builder(
                                itemBuilder: (BuildContext context, int itemIndex,
                                    int pageViewIndex) =>
                                    Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.r),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20.r),
                                            child: Image.network(
                                              '${data['data']['sliders'][itemIndex]['image']}',
                                              // controller
                                              //     .homeResponse!.slider[itemIndex].imageUrl,
                                              fit: BoxFit.fill,
                                              width: double.infinity,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.black.withOpacity(0.3),
                                          ),
                                          padding: EdgeInsets.only(
                                              top: 100.h, right: 10.w),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${data['data']['sliders'][itemIndex]['name']}',
                                                maxLines: 2,
                                                overflow: TextOverflow.clip,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w900,
                                                  fontFamily: 'noto',
                                                ),
                                              ),
                                              Text(
                                                '${data['data']['sliders'][itemIndex]['text']}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'noto',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                itemCount: data['data']['sliders'].length,
                                options: CarouselOptions(
                                  height: 202.h,
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  viewportFraction: 0.9,
                                  aspectRatio: 2.0,
                                  initialPage: 2,
                                ),
                                //controller.homeResponse!.slider.length,,
                              ),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 10.h),
                              margin: EdgeInsets.symmetric(horizontal: 15.w),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: 120.h,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/info.png',
                                      width: 140.w,
                                      height: 120.h,
                                      fit: BoxFit.fill,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '>> إعـــــــلان <<',
                                          style: TextStyle(
                                              fontFamily: 'noto',
                                              fontWeight: FontWeight.w900,
                                              fontSize: 24.sp,
                                              color: Colors.red),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Container(
                                          width: 170.w,
                                          child: AutoSizeText(
                                            '${adds['data']['adds']}',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: 'noto',
                                                fontWeight: FontWeight.bold,
                                                color: mainColor),
                                            maxLines: 3,

                                            //'${data['adds']}'
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Divider(
                              color: mainColor,
                              thickness: 2,
                              endIndent: 30,
                              indent: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20.w, bottom: 5.h),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/lastest_activities');
                                },
                                child: Text(
                                  'آخر النشاطات',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp,
                                      color: mainColor,
                                      fontFamily: 'noto'),
                                ),
                              ),
                            ),
                            isloading
                                ? Container(
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                                : GridView.builder(
                              physics: new NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              primary: true,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 0.h),
                              itemCount: posts.length,
                              // itemCount: posts.length,
                              //data['data']['courses'].length,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ActivityDetails(
                                              data: posts[index],
                                            ),
                                      ),
                                    );
                                    // Navigator.pushNamed(
                                    //     context, '/activity_details',
                                    //     arguments: data['data']['courses']
                                    //         [index]);
                                  },
                                  child: Container(
                                    margin:
                                    EdgeInsets.symmetric(horizontal: 5),
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(15.r),
                                      color: Colors.grey.shade50,
                                    ),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(15.r),
                                          child:
                                          // CachedNetworkImage(
                                          //   imageUrl: _categories[index].image,
                                          //   height: double.infinity,
                                          //   fit: BoxFit.cover,
                                          //   width: double.infinity,
                                          // ),
                                          Image.network(
                                            'https://colorz.co.il/shcool/public/images/admin/sliders/${posts[index]['image']}',
                                            //  'https://colorz.co.il/shcool/${data['data']['courses'][index]['image']}',
                                            height: 120.h,
                                            width: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        // ignore: avoid_unnecessary_containers
                                        Container(
                                          // ignore: prefer_const_constructors
                                          child: AutoSizeText(
                                            '${posts[index]['name']}',
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: mainColor,
                                                fontFamily: 'noto',
                                                fontSize: 11.sp,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 15,),
                            // Divider(
                            //   color: mainColor,
                            //   thickness: 2,
                            //   endIndent: 30,
                            //   indent: 30,
                            // ),
                            Container(
                              color: Colors.grey.shade100,
                              // margin: EdgeInsets.symmetric(horizontal: 10.h),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/course_screen');
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'جديد الدورات ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontFamily: 'noto',
                                            fontSize: 19.sp,
                                            color: mainColor,
                                          ),
                                        ),
                                        Text(
                                          'شاهد الكل ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'noto',
                                            fontSize: 14.sp,
                                            color: mainColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 120.h,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: data['data']['courses'].length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () async {
                                              //    isloading2 = true;

                                              await Controller()
                                                  .getcoursebyid(data['data']
                                              ['courses'][index]['id'])
                                                  .then((value) => {
                                                //   isloading2 = false,
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CourseDetails(
                                                          data: value['data'],
                                                        ),
                                                  ),
                                                ),
                                              });
                                              // Navigator.pushNamed(
                                              //     context, '/course_details');
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(5),
                                              margin: EdgeInsets.only(
                                                right: 15.w,
                                              ),
                                              //clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(15.r),
                                              ),
                                              height: 150.h,
                                              width: 150.w,
                                              child: Stack(
                                                fit: StackFit.expand,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        15.r),
                                                    child: Image.network(
                                                      '${data['data']['courses'][index]['image']}',
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 69.h),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(
                                                                10.r),
                                                            topRight: Radius
                                                                .circular(
                                                                10.r)),
                                                        gradient: LinearGradient(
                                                            begin: Alignment
                                                                .bottomCenter,
                                                            end: Alignment
                                                                .topCenter,
                                                            colors: [
                                                              Colors.black
                                                                  .withOpacity(
                                                                  0.8),
                                                              Colors.grey
                                                                  .withOpacity(
                                                                  0.8),
                                                            ]),
                                                      ),
                                                      // color: Color(0xff0163BE).withOpacity(.4),
                                                      alignment: Alignment.center,
                                                      child: AutoSizeText(
                                                        '${data['data']['courses'][index]['name']}',
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontFamily: 'noto',
                                                          fontSize: 12.sp,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                  ),
                ),
              ),
      ),
    ));
  }
}
