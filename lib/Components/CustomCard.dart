import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard(
      {super.key,
      required this.image,
      required this.description,
      required this.temperature});

  String image;
  String description;
  String temperature;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Expanded(
        child: Container(
      padding: EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
          color: const Color(0xff87C1EB),
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            image,
            scale: 8,
          ),
          Text(
            temperature,
            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16),
          ),
          Text(description,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 14,
              ))
        ],
      ),
    ));
  }
}
