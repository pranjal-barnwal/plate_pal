import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final assetNum;
  const StoryCard({super.key, this.assetNum});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          // 'assets/images/stories/asset{$assetNum}.png',
          'assets/images/stories/asset$assetNum.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}