import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_geocoder/model.dart';
import 'package:flutter_geocoder/services/base.dart';
import 'package:flutter_geocoder/services/distant_google.dart';
import 'package:flutter_geocoder/services/local.dart';


class LocationProvider with ChangeNotifier {
  // var latitude = 23.34;
  // var longitude = 85.30;

  var latitude = 25.22;
  var longitude = 45.32;
  String locationName = "Tap to update";

  void getCurrentLocation() async {
    //? GEOLOCATOR Package
    /// to check if we have Permission for location or not
    LocationPermission permission = await Geolocator.checkPermission();

    /// if the permission for location is denied
    if (permission == (LocationPermission.denied) || permission == (LocationPermission.deniedForever)) {
      permission = await Geolocator.requestPermission();
      print("Location Permission not allowed");
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      // print("LOCATION:");
      // print("[${currentPosition.latitude}, ${currentPosition.longitude}]");
      latitude = currentPosition.latitude;
      longitude = currentPosition.longitude;
      // print("[${locationProviderModel.latitude}, ${locationProviderModel.longitude}]");
    }

    //? flutter_geocoder Package
    //* was unable to find a free package, which can do this, and after trying and testing various packages, I found this
    getAddressDetails() async {
      final coordinates = new Coordinates(latitude, longitude);
      var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
      locationName = "${addresses.first.subLocality}, ${addresses.first.locality}";
      // print("ADDRESS: $locationName");
    }

    await getAddressDetails();

  }


}
