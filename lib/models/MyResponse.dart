class MyResponse {
  bool? success;
  Data? data;
  String? message;
  List<Null>? errors;

  MyResponse({this.success, this.data, this.message, this.errors});

  MyResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    if (json['errors'] != null) {
      errors = <Null>[];

    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;

    return data;
  }
}

class Data {
  Classes? classes;

  Data({this.classes});

  Data.fromJson(Map<String, dynamic> json) {
    classes =
    json['classes'] != null ? new Classes.fromJson(json['classes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.classes != null) {
      data['classes'] = this.classes!.toJson();
    }
    return data;
  }
}

class Classes {
  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s5;
  String? s6;
  String? s7;
  String? s8;
  String? s9;
  String? s10;
  String? s11;
  String? s12;

  Classes(
      {this.s1,
        this.s2,
        this.s3,
        this.s4,
        this.s5,
        this.s6,
        this.s7,
        this.s8,
        this.s9,
        this.s10,
        this.s11,
        this.s12});

  Classes.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    s6 = json['6'];
    s7 = json['7'];
    s8 = json['8'];
    s9 = json['9'];
    s10 = json['10'];
    s11 = json['11'];
    s12 = json['12'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['5'] = this.s5;
    data['6'] = this.s6;
    data['7'] = this.s7;
    data['8'] = this.s8;
    data['9'] = this.s9;
    data['10'] = this.s10;
    data['11'] = this.s11;
    data['12'] = this.s12;
    return data;
  }
}
