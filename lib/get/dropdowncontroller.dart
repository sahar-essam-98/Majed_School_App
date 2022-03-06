import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:school/api/api_settings.dart';
import 'package:school/models/city.dart';

import '../models/MyResponse.dart';

class DropDownController extends GetxController {
  String? selectedValue;
  final selected = "".obs;
  void setSelected(String value) {
    selected.value = value;
  }

  Future<List<String>> getStageOfEducation() async {

    var url = Uri.parse("https://colorz.co.il/shcool/public/api/classes");
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: 'application/json',
    });
    print("the 'input ${response.body}");
    if (response.statusCode == 200) {
      print("the output f");
      var  myClsss = MyResponse.fromJson(jsonDecode(response.body));
      print("the output ${myClsss.data!.classes!.toJson()}");
      var map = myClsss.data!.classes!.toJson();
      print("the map is ${map}");
      List<String> list = [];
      map.forEach((k, v) => list.add(v));
      print("the list is ${list}");

      // var citiesJsonArray = jsonDecode(response.body)['list'] as List;

      // print("the output ${citiesJsonArray}");
      print("the output fw");

      return list;
    }
    return [];
  }
}
