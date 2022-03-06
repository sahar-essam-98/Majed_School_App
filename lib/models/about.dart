


class Department {
  bool? success;
  Data? data;
  String? message;
  List<Null>? errors;

  Department({this.success, this.data, this.message, this.errors});

  Department.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    if (json['errors'] != null) {
      errors = <Null>[];
      json['errors'].forEach((v) {
      //  errors!.add( Null.fromJson(v));
      });
    }
  }


}

class Data {
  int? id;
  String? name;
  int? departmentTypeId;
  int? order;
  int? isActive;
  String? image;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  DepartmentType? departmentType;
  List<Posts>? posts;

  Data(
      {this.id,
        this.name,
        this.departmentTypeId,
        this.order,
        this.isActive,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.departmentType,
        this.posts});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    departmentTypeId = json['department_type_id'];
    order = json['order'];
    isActive = json['is_active'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    departmentType = json['department_type'] != null
        ? new DepartmentType.fromJson(json['department_type'])
        : null;
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }


}

class DepartmentType {
  int? id;
  String? name;
  Null? createdAt;
  Null? updatedAt;
  Null? deletedAt;

  DepartmentType(
      {this.id, this.name, this.createdAt, this.updatedAt, this.deletedAt});

  DepartmentType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }


}

class Posts {
  int? id;
  int? departmentId;
  String? name;
  String? image;
  String? text;
  Null? link;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Posts(
      {this.id,
        this.departmentId,
        this.name,
        this.image,
        this.text,
        this.link,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departmentId = json['department_id'];
    name = json['name'];
    image = json['image'];
    text = json['text'];
    link = json['link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }


}