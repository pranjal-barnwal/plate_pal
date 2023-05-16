import 'package:flutter/material.dart';

/*
  //:/  SAMPLE DATA
  {
    "id": "5",
    "name": "Kake Da Hotel",
    "tags": "Chicken, Naan",
    "rating": "4.9",
    "discount": "20",
    "primary_image": "https://theoptimiz.com/restro/public/Resturants/kake-da-hotel.png",
    "distance": "3174.53"
  },
*/

class RestaurantCard extends StatelessWidget {
  var restroData = {
    "id": "5",
    "name": "Kake Da Hotel",
    "tags": "Chicken, Naan",
    "rating": "4.9",
    "discount": "20",
    "primary_image":
        "https://theoptimiz.com/restro/public/Resturants/kake-da-hotel.png",
    "distance": "3174.53"
  };
  late List<String> tagsList;

  RestaurantCard({super.key});

  createTagsList(){
    tagsList = restroData['tags']!.split(", ");
  }

  

  @override
  Widget build(BuildContext context) {
    createTagsList();
    
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 0, 5, 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 6,
      child: Column(children: [
        Stack(
          children: [
            Container(
              height: 140,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  restroData['primary_image']!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xff00c800),
                ),
                child: Row(
                  children: [
                    Text(
                      restroData['rating']!,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 2),
                    Icon(Icons.star, color: Colors.white, size: 14,)
                  ],
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restroData['name']!,
                    style: TextStyle(
                      color: Colors.blueGrey.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: tagsList.map(
                      (tag) => Row(
                        children: [
                          const Icon(Icons.circle, size: 7),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(3, 0, 8, 0),
                            child: Text(
                              tag,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      )
                    ).toList(),
                  ),
                ],
              ),
            ),
            Padding(
              // padding: const EdgeInsets.only(right:10),
              padding: const EdgeInsets.fromLTRB(0, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.verified_rounded, color: Color(0xffff0000), size: 24,),
                      const SizedBox(width: 4),
                      Text(
                        "${restroData["discount"]!}% FLAT OFF",
                        style: const TextStyle(
                          color: Color(0xffff0000),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.map, 
                        size: 18,
                        color: Colors.blueGrey.shade500,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "${(double.parse(restroData['distance']!)/1000.0).toStringAsFixed(2)}km away",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey.shade600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
