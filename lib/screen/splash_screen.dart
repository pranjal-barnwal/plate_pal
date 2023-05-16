import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:plate_pal/complete_layout.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../providers/location.dart';
import '../providers/restaurants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      print("TIMED NAVIGATION Instantiated");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CompleteLayout()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<RestaurantsProvider, LocationProvider>(
        builder: (context, restrosProviderModel, locationProviderModel, child) {
      // Call the async functions one after another using Future.then
      Future<void> fetchRestaurants(double lat, double lng) async {
        locationProviderModel.fetchLocation();
        
        final url = Uri.parse(
            'https://theoptimiz.com/restro/public/api/get_resturants');
        final body = json.encode({
          'lat': locationProviderModel.latitude,
          'lng': locationProviderModel.longitude,
        });
        final response = await http.post(url,
            body: body, headers: {'Content-Type': 'application/json'});

        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);
          // print("JSONDATA:");
          // print(jsonData);

          if(jsonData['status'] == 'SUCCESS') {
            print(jsonData['data']);
            // List<dynamic> convertedData = jsonData['data'].values.toList();
            // List<Map<String, String>> convertedData = jsonData.map((map) {
            //   return map.map((key, value) => MapEntry(key, value.toString()));
            // }).toList();
            
            restrosProviderModel.items = jsonData['data'];
            restrosProviderModel.fetchRestros(jsonData['data']);
            setState(() {});
            // print("DATA:");
            // print(restrosProviderModel.items);
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => CompleteLayout()),
            // );
          } else {
            throw Exception('Failed to fetch restaurants');
          }
        } else {
          throw Exception('Failed to connect to the API');
        }
      }

      fetchRestaurants(locationProviderModel.latitude, locationProviderModel.longitude);

      return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/splash-screen.gif',
              ),
              const SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Plate",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.shade900,
                      ),
                    ),
                    const TextSpan(
                      text: "Pal",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Loading exciting restaurants \nfor you!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
