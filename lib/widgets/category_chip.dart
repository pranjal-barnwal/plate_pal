import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/restaurants.dart';

class CategoryChip extends StatelessWidget {
  final String currCategory;
  const CategoryChip(
      {super.key, required this.currCategory});

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantsProvider>(builder: (context, restrosProviderModel, child) {
      return Container(
        margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
        child: ElevatedButton(
          style: ((restrosProviderModel.activeCategory) == currCategory)
              ? ElevatedButton.styleFrom(
                  elevation: 6,
                  backgroundColor: Color(0xffff4550),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                )
              : ElevatedButton.styleFrom(
                  elevation: 6,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
          onPressed: () {
            restrosProviderModel.updateActive(currCategory);
          },
          child: Container(
            height: 30,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                (currCategory == "All")
                    ? Text("")
                    : Row(
                        children: [
                          Image.asset(
                            'assets/images/food_logo/${currCategory.toLowerCase()}.png',
                          ),
                          SizedBox(width: 5),
                        ],
                      ),
                (currCategory == "All" || currCategory == restrosProviderModel.activeCategory)
                    ? Text(
                        currCategory,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(""),
              ],
            ),
          ),
        ),
      );
    });
  }
}
