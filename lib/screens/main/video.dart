import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/controllers/api_controller.dart';
import 'package:school/widgets/constants.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:auto_size_text/auto_size_text.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  var data;

  bool isloading = false;

  allvideos() async {
    setState(() {
      isloading = true;
    });
    try {
      Controller().allvideos().then((value) => {
            setState(() {
              isloading = false;
            }),
            if (value != null)
              {
                setState(() {
                  data = value['data'];
                }),
                print("the data is $data"),
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

  late YoutubePlayerController _ytbPlayerController;

  List<YoutubePlayerController> ytlist = [];

  @override
  void initState() {
    // TODO: implement initState
    allvideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'مكتبة الفيديو',
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
                ytlist = [];

                return Container(
                  width: double.infinity,
                  // height: 350.h,
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        // ignore: unnecessary_null_comparison
                        child: YoutubePlayerIFrame(
                          controller: YoutubePlayerController(
                            initialVideoId: data[index]['path']
                                .toString()
                                .split("=")[1]
                                .split("&")[0],
                            params: const YoutubePlayerParams(
                              showFullscreenButton: true,
                              autoPlay: false,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: AutoSizeText(
                          '${data[index]['name']}',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'noto',
                              color: mainColor),
                        ),
                      ),
                    ],
                  ),

                );
              }),
    );
  }
}
