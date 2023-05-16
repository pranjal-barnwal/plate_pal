import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plate_pal/providers/restaurant.dart';

class RestaurantsProvider with ChangeNotifier{
  List<Map<String, dynamic>> items = [];

  void fetchRestros(List<Map<String, dynamic>> newItems){
    items = newItems;
    notifyListeners();
  }

}