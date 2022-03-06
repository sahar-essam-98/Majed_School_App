import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/controllers/api_controller.dart';
import 'package:school/screens/album/all_photos.dart';
import 'package:school/widgets/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  var data;

  bool isloading = false;

  getallalbum() async {
    setState(() {
      isloading = true;
    });
    try {
      Controller().allalbum().then((value) => {
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
    getallalbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ألبوم الصور',
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
          : GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        itemCount: data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: InkWell(
                onTap: () {
                  // print("dd ${data[index]}");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllPhoto(
                        id: data[index]['id'],
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(7.w),
                  color: Colors.white.withOpacity(0.1),
                  child: Column(
                    children: [
                      Container(
                        height: 120.h,
                        width: 160.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: data[index]['image'] == null
                              ? Image.asset('assets/icon.png')
                              : Image.network(
                            '${data[index]['image']}',
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h,),
                      Container(
                        child: AutoSizeText(
                          '${data[index]['name']}',
                          style: TextStyle(
                              color: mainColor,
                              fontFamily: 'noto',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}