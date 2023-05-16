import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plate_pal/providers/restaurants.dart';
import 'package:plate_pal/widgets/category_chip.dart';
import 'package:plate_pal/widgets/restaurant_card.dart';
import 'package:plate_pal/widgets/story_card.dart';
import 'package:provider/provider.dart';

import '../providers/location.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var categoriesList = ["All", "Pizza", "Chicken", "Salad", "Burger"];

  var activeCategory = "Pizza";

  @override
  Widget build(BuildContext context) {
    return Consumer2<RestaurantsProvider, LocationProvider>(
      builder: (context, restrosProviderModel, locationProviderModel, child) {
      // locationProviderModel.fetchLocation();
      print("************* ITEM: 0 *************");
      print(restrosProviderModel.items);
        
      return Container(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.red.shade100,
                Colors.red.shade50,
                Colors.white,
                Colors.white,
                Colors.white,
              ]),
        ),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //:/  LOCATION SECTION
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: const Icon(Icons.location_on),
                  ),
                  Text("${locationProviderModel.latitude}, ${locationProviderModel.longitude}", style: TextStyle(fontSize: 16)),
                ],
              ),

              const SizedBox(height: 10),
              //:/  STORIES SECTION
              const Text(
                "Stories",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    4,
                    (index) => StoryCard(assetNum: index + 1),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              //:/  SEARCHBAR SECTION
              Material(
                elevation: 5,
                borderRadius: const BorderRadius.all(Radius.circular(36)),
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.search, color: Colors.blueGrey.shade900),
                      hintText: 'Search Food Items',
                      hintStyle: TextStyle(
                        color: Colors.blueGrey.shade300,
                        fontWeight: FontWeight.w100,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),

              //:/  CATEGORY-CHIPS SECTION
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                height: 85,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, ind) => CategoryChip(
                    activeCategory: activeCategory,
                    currCategory: categoriesList[ind],
                  ),
                  itemCount: categoriesList.length,
                ),
              ),

              //:/  NEARBY SECTION
              const Text(
                "Nearby Restaurants",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 390,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (ctx, ind) =>
                      (ind + 1 != restrosProviderModel.items.length)
                          ? RestaurantCard(
                              restroData: restrosProviderModel.items[ind].map((key, value) => MapEntry(key, value.toString())),
                            )
                          : Padding(
                              padding: EdgeInsets.only(bottom: 60),
                              child: RestaurantCard(
                                restroData: restrosProviderModel.items[ind],
                              ),
                            ),

                  /// to keep the all the cards visible in all device dimensions, extra padding is added at the bottom of last RestaurantCard
                  itemCount: restrosProviderModel.items.length,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
