import 'package:flutter/cupertino.dart';
import 'package:machinetest/Webservice/Webservice.dart';

class Viewmodel extends ChangeNotifier {
  List<dynamic> TopCourses = [];
  List<dynamic> Categories = [];

  GetViewTopCourses() async {
    TopCourses = await Webservice().GetTopCourses();
    notifyListeners();
  }

  GetViewCategories() async {
    Categories = await Webservice().GetCategories();
    notifyListeners();
  }
}
