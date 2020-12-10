import 'package:flutter/material.dart';

class Speakers_widget extends StatelessWidget {
  final String image, name;
  final Color color;
  const Speakers_widget({
    Key key,
    this.image,
    this.name,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            height: 160,
            width: 130,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(
                25,
              ),
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(name),
        ],
      ),
    );
  }
}
