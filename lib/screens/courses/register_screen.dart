import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:school/controllers/api_controller.dart';
import 'package:school/get/dropdowncontroller.dart';
import 'package:school/widgets/constants.dart';
import 'package:school/widgets/text_app2_field.dart';

class RegisterScreen extends StatefulWidget {
  dynamic data;

  RegisterScreen({this.data, Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  DropDownController dropDownController = DropDownController();
  List<String> _stages = <String>[];
  late Future<List<String>> _future;
  bool createDrop = false;
  String dropdownValue = 'ذكر';
  String dropdownValue2 = 'الأول';
  int _stageId = 1;
  bool agree = false;

  String initialValue = 'Gaza';
  late TextEditingController _nameTextController;
  late TextEditingController _idTextController;
  late TextEditingController _schoolTextController;
  late TextEditingController _mobileTextController;
  late TextEditingController _dadMobileTextController;
  late TextEditingController _momMobileTextController;

  String _gender = 'M';

  @override
  void initState() {
    super.initState();
    _future = DropDownController().getStageOfEducation();
    getClasses();
    // print(_future);
    _nameTextController = TextEditingController();
    _idTextController = TextEditingController();
    _schoolTextController = TextEditingController();
    _mobileTextController = TextEditingController();
    _dadMobileTextController = TextEditingController();
    _momMobileTextController = TextEditingController();
  }

  int gender_id = 1;
  int educational_level_id = 1;
  List<String> myData = [];

  getClasses() async {
    try {
      await DropDownController().getStageOfEducation().then((value) => {
            if (value != null)
              {
                setState(() {
                  myData = value;
                }),
                print("the data is $myData")
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
  Widget build(BuildContext context) {
    // print("the values are ${widget.data}");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'اللتسجيل في الدورة',
          style: TextStyle(fontFamily: 'noto', fontSize: 16.sp),
        ),
        centerTitle: true,
        backgroundColor: mainColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(children: [
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
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20.0.w),
                      height: 800.h,
                      width: 500.w,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.9),
                            offset: const Offset(-1, 0),
                            blurRadius: 20.r,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              'الرجاء تعبئة نموذج التسجيل في الدورة و التأكد من صحة و دقة البيانات المسجلة',
                              style: TextStyle(
                                  color: mainColor,
                                  fontFamily: 'noto',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 15.h),
                            AppTextField2(
                              hint: 'الاسم',
                              textEditingController: _nameTextController,
                            ),
                            SizedBox(height: 10.h),
                            AppTextField2(
                              hint: 'رقم الهوية',
                              textEditingController: _idTextController,
                            ),
                            SizedBox(height: 10.h),
                            // AppTextField2(
                            //   hint: 'اسم المدرسة',
                            //  obscureText: true,
                            //  textEditingController: _schoolTextController,
                            // ),
                            SizedBox(height: 10.h),
                            // FutureBuilder<List<String>>(
                            //   future: _future,
                            //   builder: (context, snapshot) {
                            //     if (snapshot.connectionState ==
                            //         ConnectionState.waiting) {
                            //       return Center(
                            //         child: SizedBox(
                            //           child: CircularProgressIndicator(
                            //             color: Color(0xff0163BE),
                            //           ),
                            //           height: 16.h,
                            //           width: 16.w,
                            //         ),
                            //       );
                            //     } else if (snapshot.hasData &&
                            //         snapshot.data!.isNotEmpty) {
                            //       _stages = snapshot.data ?? [];
                            //       if (!createDrop) {
                            //         dropDownValue = _stages.first;
                            //       }
                            //       return DropdownButton<String>(
                            //         isExpanded: true,
                            //         value: dropDownValue,
                            //         icon: const Icon(
                            //           Icons.arrow_drop_down,
                            //           color: Color(0xff0163BE),
                            //         ),
                            //         underline: const SizedBox(),
                            //         items: _stages.map((e) {
                            //           return DropdownMenuItem<String>(
                            //             child: Text(
                            //               e,
                            //               style: TextStyle(
                            //                   fontFamily: 'noto',
                            //                   fontSize: 12.sp,
                            //                   color: Colors.grey.shade600),
                            //             ),
                            //             value: e,
                            //           );
                            //         }).toList(),
                            //         onChanged: (value) {
                            //           setState(() {
                            //             dropDownValue = value!;
                            //             createDrop = true;
                            //             // _stageId = value.id;
                            //           });
                            //         },
                            //       );
                            //     } else {
                            //       return Center();
                            //     }
                            //   },
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'اختــر النـــوع',
                                  style: TextStyle(
                                      fontFamily: 'noto',
                                      color: mainColor,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            DropdownButton<String>(
                              isExpanded: true,
                              underline: const SizedBox(),
                              value: dropdownValue,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xff0163BE),
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                  // ignore: unrelated_type_equality_checks
                                  if (dropdownValue == 'ذكر') {
                                    gender_id = 1;
                                  } else {
                                    gender_id = 2;
                                  }
                                });
                              },
                              items: <String>[
                                'ذكر',
                                'أنثى',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        fontFamily: 'noto',
                                        fontSize: 12.sp,
                                        color: Colors.grey.shade600),
                                  ),
                                );
                              }).toList(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'اختــر الصــف',
                                  style: TextStyle(
                                      fontFamily: 'noto',
                                      color: mainColor,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            DropdownButton<String>(
                              isExpanded: true,
                              underline: const SizedBox(),
                              value: dropdownValue2,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xff0163BE),
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue2 = newValue!;

                                });
                              },
                              items: myData.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        fontFamily: 'noto',
                                        fontSize: 12.sp,
                                        color: Colors.grey.shade600),
                                  ),
                                );
                              }).toList(),
                            ),
                            SizedBox(height: 10.h),
                            AppTextField2(
                              hint: 'رقم الهاتف',
                              textEditingController: _mobileTextController,
                            ),
                            SizedBox(height: 10.h),
                            AppTextField2(
                              hint: 'رقم هاتف الأب',
                              textEditingController: _dadMobileTextController,
                            ),
                            SizedBox(height: 10.h),
                            AppTextField2(
                              hint: 'رقم هاتف الأم',
                              obscureText: true,
                              textEditingController: _momMobileTextController,
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'أوافق على الشروط الخاصة بالدورة و متأكد من صحة البيانات',
                                  style: TextStyle(
                                      fontFamily: 'noto',
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Material(
                                  color: Colors.grey.shade200,
                                  child: Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: mainColor,
                                    value: agree,
                                    onChanged: (value) {
                                      setState(() {
                                        agree = value ?? false;

                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            isloading
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ElevatedButton(
                                    onPressed: agree
                                        ? () async => await performRegister()
                                        : null,
                                    child: Text(
                                      'تأكيد',
                                      style: TextStyle(
                                          fontFamily: 'noto',
                                          fontSize: 14.sp,
                                          color: mainColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      minimumSize: Size(300.w, 50.h),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  bool isloading = false;

  Future<void> performRegister() async {

    if (checkData()) {
      // print(agree);
      await register();
    }
  }

  bool checkData() {
    print(_dadMobileTextController.text.isNotEmpty);
    if (_nameTextController.text.isNotEmpty &&
        _idTextController.text.isNotEmpty &&
        // _schoolTextController.text.isNotEmpty &&
        _mobileTextController.text.isNotEmpty &&
        _dadMobileTextController.text.isNotEmpty &&
        _momMobileTextController.text.isNotEmpty) {
      return true;
    }

    return false;
  }

  Future<void> register() async {

    setState(() {
      isloading = true;
    });
    await Controller().addstudent(
        name: _nameTextController.text,
        gender_id: gender_id,
        educational_level_id: 1,
        national_id: _idTextController.text,
        school: dropdownValue2,
        // school: _schoolTextController.text,
        phone: _mobileTextController.text,
        course_id: widget.data['id'],
        mother_phone: _momMobileTextController.text,
        father_phone: _dadMobileTextController.text);


    setState(() {
      isloading = false;
    });

    Fluttertoast.showToast(msg: 'Student has been added successfully');
  }
}
