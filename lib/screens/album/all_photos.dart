import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school/controllers/api_controller.dart';
import 'package:school/widgets/constants.dart';
import 'package:share_plus/share_plus.dart';

class AllPhoto extends StatefulWidget {
  dynamic id;

  AllPhoto({this.id, Key? key}) : super(key: key);

  @override
  _AllPhotoState createState() => _AllPhotoState();
}

class _AllPhotoState extends State<AllPhoto> {
  late PageController _pageController;
  int _currentPage = 0;
  var data;

  bool isloading = false;

  getallalbum() async {
    setState(() {
      isloading = true;
    });
    try {
      Controller().albumbyid(widget.id).then((value) => {
        setState(() {
          isloading = false;
        }),
        if (value != null)
          {
            setState(() {
              data = value['data'];
            }),
            print("the albumbyid is $data")
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
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الصور',
          style: TextStyle(fontFamily: 'noto', fontSize: 16.sp),
        ),
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      backgroundColor: Colors.white,
      body: isloading
      // ignore: prefer_const_constructors
          ? Center(
        child: const CircularProgressIndicator(),
      )
          : Center(
        child: Column(
          children: [
            Container(
              height: 600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.only(
                  top: 80, right: 10, left: 10, bottom: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data['images'].length,
                itemBuilder: (context, i) => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          data['images'] == null
                              ? ""
                              : "${data['images'][i]['name']}",
                          height: 600.h,
                          width: 350.w,
                          fit: BoxFit.fill,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          Share.share('${data['images'][i]['name']}',
                              subject: 'Look what I made!');
                          // print("fff ${data['images'][i]['name']}");
                          /* try {
                                                   final ByteData bytes = await rootBundle.load('${data['images'][i]['name']}');
                                                   await WcFlutterShare.share(
                                                       sharePopupTitle: 'share',
                                                       fileName: 'share.png',
                                                       mimeType: 'image/',
                                                       bytesOfFile: bytes.buffer.asUint8List());
                                                 } catch (e) {
                                                   print('error: $e');
                                                 }*/
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.solidShareSquare,
                          size: 25,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
// data['images'] == null
// ? ""
//     : "https://colorz.co.il/shcool/${data['images'][i]['image']}",