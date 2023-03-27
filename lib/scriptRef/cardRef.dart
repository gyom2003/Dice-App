
import 'package:flutter/material.dart';


class SingleCard {
  final String title;
  final String imagePath;

  const SingleCard({
    required this.title,
    required this.imagePath, 
  });
}

List<SingleCard> items = [
  const SingleCard(title: 'image title', imagePath: 'images/one.jpg'), 
  const SingleCard(title: 'image title', imagePath: 'images/two.jpg'), 
  const SingleCard(title: 'image title', imagePath: 'images/three.jpeg'), 
  const SingleCard(title: 'image title', imagePath: 'images/four.jpg'), 
];


Widget cardReference({
  required SingleCard item, 
}) => 
SizedBox(
  width: 200, 
  height: 200,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: AspectRatio(
        aspectRatio: 4/3,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Stack(
              children: [
                 Image.asset(
                  item.imagePath, 
                  fit: BoxFit.cover, 
                  width: 200,
                  height: 150,
                ),
                Container(
                  width: 200,
                  height: 30,
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(top: 110, left: 20),
                  child: const Text("Some Dice event", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
        
                ), 
              ],
              ),  
            )
          )
        ),
          
    ],
  ),    
); 