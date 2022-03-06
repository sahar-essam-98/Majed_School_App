class Courses {
  bool? success;
  Data? data;
  String? message;
  List<Null>? errors;

  Courses({this.success, this.data, this.message, this.errors});

  Courses.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    if (json['errors'] != null) {
      errors = <Null>[];
      json['errors'].forEach((v) {
      //  errors!.add(new Null.fromJson(v));
      });
    }
  }


}

class Data {
  int? id;
  String? name;
  String? encounters;
  String? hours;
  String? duration;
  String? anchor;
  String? targetGroup;
  int? price;
  String? registrationExpires;
  String? image;
  String? details;
  String? startDate;
  String? endDate;
  String? location;
  int? studentsNo;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  List<Students>? students;

  Data(
      {this.id,
        this.name,
        this.encounters,
        this.hours,
        this.duration,
        this.anchor,
        this.targetGroup,
        this.price,
        this.registrationExpires,
        this.image,
        this.details,
        this.startDate,
        this.endDate,
        this.location,
        this.studentsNo,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.students});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    encounters = json['encounters'];
    hours = json['hours'];
    duration = json['duration'];
    anchor = json['anchor'];
    targetGroup = json['target_group'];
    price = json['price'];
    registrationExpires = json['registration_expires'];
    image = json['image'];
    details = json['details'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    location = json['location'];
    studentsNo = json['students_no'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
  }


}

class Students {
  int? id;
  int? courseId;
  String? name;
  String? nationalId;
  String? school;
  int? genderId;
  String? educationalLevelId;
  String? phone;
  String? fatherPhone;
  String? motherPhone;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Students(
      {this.id,
        this.courseId,
        this.name,
        this.nationalId,
        this.school,
        this.genderId,
        this.educationalLevelId,
        this.phone,
        this.fatherPhone,
        this.motherPhone,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    name = json['name'];
    nationalId = json['national_id'];
    school = json['school'];
    genderId = json['gender_id'];
    educationalLevelId = json['educational_level_id'];
    phone = json['phone'];
    fatherPhone = json['father_phone'];
    motherPhone = json['mother_phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }


}