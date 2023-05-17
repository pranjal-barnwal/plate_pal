import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestaurantsProvider with ChangeNotifier{
  List<Map<String, dynamic>> items = [];
  List<Map<String, dynamic>> itemsCopy = [];
  var activeCategory = "All";

  void fetchRestros(List<Map<String, dynamic>> newItems){
    items = newItems;
    itemsCopy = items;
    notifyListeners();
  }

  void updateActive(String newCat){
    activeCategory = newCat;
    notifyListeners();
  }

}