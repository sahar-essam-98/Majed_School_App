import 'dart:convert';

import 'package:http/http.dart' as http;

class Controller {
  bool isLoading = false;
  dynamic apiurl = "https://colorz.co.il/shcool/public/api";

  Future<dynamic> gethome({dynamic id}) async {
    print("im home");

    var res = await http.get(
      Uri.parse("$apiurl/home"),
      headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      },
    );
    final data = await json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      final data = await json.decode(res.body);
      print(data);

      return data;
    } else {
      return "error";
    }
  }

  Future<dynamic> getdepartment() async {
    print("im getdepartment");

    var res = await http.get(
      Uri.parse("$apiurl/departments?id=2"),
      headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      },
    );

    List posts = [];
    if (res.statusCode == 200) {
      final data = await json.decode(res.body);
      for (int i = 0; i < data['data']['posts'].length; i++) {
        posts.add(data['data']['posts'][i]);
      }

      var res2 = await http.get(
        Uri.parse("$apiurl/departments?id=3"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
      );

      if (res2.statusCode == 200) {
        final data2 = await json.decode(res2.body);

        for (int i = 0; i < data2['data']['posts'].length; i++) {
          posts.add(data2['data']['posts'][i]);
        }
      }
      print(posts.length);
      return posts;
    } else {
      return "error";
    }
  }

  Future<dynamic> allimages() async {
    print("im images/all");

    var res = await http.get(
      Uri.parse("$apiurl/images/all"),
      headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      },
    );
    final data = await json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      final data = await json.decode(res.body);
      print(data);

      return data;
    } else {
      return "error";
    }
  }

  Future<dynamic> allalbum() async {
    print("im album/all");

    var res = await http.get(
      Uri.parse("$apiurl/album/all"),
      headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      },
    );
    final data = await json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      final data = await json.decode(res.body);
      print(data);

      return data;
    } else {
      return "error";
    }
  }

  Future<dynamic> albumbyid(id) async {
    print("im album?id=$id");

    var res = await http.get(
      Uri.parse("$apiurl/album?id=$id"),
      headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      },
    );
    final data = await json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      final data = await json.decode(res.body);
      print(data);

      return data;
    } else {
      return "error";
    }
  }

  Future<dynamic> allvideos() async {
    print("im videos/all");

    var res = await http.get(
      Uri.parse("$apiurl/videos/all"),
      headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      },
    );
    final data = await json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      final data = await json.decode(res.body);
      print(data);

      return data;
    } else {
      return "error";
    }
  }

  Future<dynamic> allnotifications() async {
    print("im allnotifications");

    var res = await http.get(
      Uri.parse("$apiurl/notifications/all"),
      headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      },
    );
    final data = await json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      final data = await json.decode(res.body);
      print(data);

      return data;
    } else {
      return "error";
    }
  }

  Future<dynamic> alladds() async {
    print("im alladds");

    var res = await http.get(
      Uri.parse("$apiurl/adds"),
      headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      },
    );
    final data = await json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      final data = await json.decode(res.body);
      print(data);

      return data;
    } else {
      return "error";
    }
  }

  Future<dynamic> getallcourses() async {
    print("im home");

    var res = await http.get(
      Uri.parse("$apiurl/courses/all"),
      headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      },
    );
    final data = await json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      final data = await json.decode(res.body);
      print(data);

      return data;
    } else {
      return "error";
    }
  }

  Future<dynamic> getcoursebyid(id) async {
    print("im home");

    var res = await http.get(
      Uri.parse("$apiurl/courses?id=$id"),
      headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      },
    );
    final data = await json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      final data = await json.decode(res.body);
      print(data);

      return data;
    } else {
      return "error";
    }
  }

  Future<dynamic> getdepartmentbyid(id) async {
    print("$apiurl/departments?id=$id");

    var res = await http.get(
      Uri.parse("$apiurl/departments?id=$id"),
      headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      },
    );
    final data = await json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      final data = await json.decode(res.body);
      print(data);

      return data;
    } else {
      return "error";
    }
  }

  Future<dynamic> addstudent(
      {name,
      national_id,
      school,
      gender_id,
      educational_level_id,
      phone,
      father_phone,
      mother_phone,
      course_id}) async {
    print("im here $mother_phone $father_phone $phone $educational_level_id $gender_id $school $name $national_id");
    var mydata = {
      "name": '$name',
      "national_id": '$national_id',
      "school": '$school',
      "gender_id": '$gender_id',
      "educational_level_id": '$educational_level_id',
      "phone": '$phone',
      "mother_phone": '$mother_phone',
      "course_id": '$course_id',
      "father_phone":'$father_phone'
    };
    var res = await http.post(Uri.parse("$apiurl/courses/students"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: mydata);
    print("ggggggggggggg ${res}");

    if (res.statusCode == 200) {
      final data = await json.decode(res.body);
      print(data);

      return data;
    } else {
      return "error";
    }
  }


  Future<dynamic> contactus({title, email, phone, text, name}) async {
    title = '';
    print("im here $apiurl/courses/students ${title} $email $phone $text");
    title = '';
    var res = await http.post(
        Uri.parse(
            "$apiurl/contact/send?title=$title&email=$email&phone=$phone&text=$text&name=$name"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <dynamic, dynamic>{});

    if (res.statusCode == 200) {
      final data = await json.decode(res.body);
      print(data);

      return data;
    } else {
      return "error";
    }
  }

  Future<dynamic> infoApp() async {
    print("im info");

    var res = await http.get(
      Uri.parse("$apiurl/info"),
      headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      },
    );
    final data = await json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      final data = await json.decode(res.body);
      print(data);

      return data;
    } else {
      return "error";
    }
  }
}
