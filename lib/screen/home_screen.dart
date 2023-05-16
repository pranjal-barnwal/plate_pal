import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plate_pal/widgets/category_chip.dart';
import 'package:plate_pal/widgets/restaurant_card.dart';
import 'package:plate_pal/widgets/story_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  var categoriesList = ["All", "Pizza", "Chicken", "Salad", "Burger"];
  var activeCategory = "Pizza";

  @override
  Widget build(BuildContext context) {
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
                const Text("Location", style: TextStyle(fontSize: 16)),
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
                    prefixIcon: Icon(
                      Icons.search, 
                      color: Colors.blueGrey.shade900

                    ),
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
              height: 350,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (ctx, ind) => RestaurantCard(),
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
