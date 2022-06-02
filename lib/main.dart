import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:school/screens/activity_screens/activity_details.dart';
import 'package:school/screens/constant_screens/about_screen.dart';
import 'package:school/screens/constant_screens/lounch_screen.dart';
import 'package:school/screens/constant_screens/out_boarding_screen.dart';
import 'package:school/screens/courses/course_details.dart';
import 'package:school/screens/courses/courses.dart';
import 'package:school/screens/courses/register_screen.dart';
import 'package:school/screens/album/all_photos.dart';
import 'package:school/screens/main/contact_us.dart';
import 'package:school/screens/main/main_screen.dart';
import 'package:school/screens/album/photo.dart';
import 'package:school/screens/main/video.dart';
import 'package:school/screens/news_screens/all_news.dart';

import 'package:school/screens/notification/notification.dart';

import 'screens/activity_screens/all_activity.dart';
import 'screens/news_screens/news_details.dart';
import 'screens/notification/notification_detail.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(debugShowCheckedModeBanner: false,home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
      // minTextAdapt: true,
      // splitScreenMode: true,
      builder: () => MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          // ignore: prefer_const_literals_to_create_immutables
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale("ar"),
          ],
          locale: Locale("ar"),
          debugShowCheckedModeBanner: false,
          initialRoute: '/launch_screen',
          routes: {
            '/launch_screen': (context) =>  LaunchScreen(),
            '/main_screen': (context) =>  MainScreen(),
            '/notification_screen': (context) =>  NotificationScreen(),
            '/contact_screen': (context) =>  ContactScreen(),
            '/photo_screen': (context) =>  PhotoScreen(),
            '/all_photo_screen': (context) => AllPhoto(),
            '/course_screen': (context) =>  CourseScreen(),
            '/course_details': (context) => CourseDetails(),
            '/video_screen': (context) =>  VideoScreen(),
            '/about_screen': (context) => AboutScreen(),
            '/register_screen': (context) => RegisterScreen(),
            '/activity_details': (context) => ActivityDetails(),
            '/all_activities': (context) =>  AllActivity(),
            '/all_news': (context) => AllNews(),
            '/news_details': (context) =>  NewsDetails(),
            '/out_bording_screen' : (context) => const OutBoardingScreen(),
            '/notification_details': (context) =>  NotificationDetails(null),

          },
        ),
      ),
    );
  }
}