import 'package:flutter/foundation.dart';

class Restaurant with ChangeNotifier{
  final String id;
  final String name;
  final List<String> tags;
  final double rating;
  final int discount;
  final String primary_image;
  final double distance;
  bool isFavorite;

  Restaurant({
    required this.id,
    required this.name,
    required this.tags,
    required this.rating,
    required this.discount,
    required this.primary_image,
    required this.distance,
    this.isFavorite = false,
  });
  
  void toggleFavaoriteStatus(){
    isFavorite = !isFavorite;
    notifyListeners();
  }
  
}