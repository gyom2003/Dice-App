

import 'package:flutter/material.dart';
import '../../scriptRef/clipper.dart'; 
import '../../scriptRef/menuCard.dart'; 
import '../../scriptRef/greyItem.dart'; 
import '../menu.dart';

class Burgerpage extends StatelessWidget {
  const Burgerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Opacity(opacity: 0.5, child: ClipPath(
            clipper: CustomClipref(),
            child: Container(color: const Color(0xFFE9BD1F)),
          ),), 
          Container(
            margin: const EdgeInsets.only(top: 80, left: 40),
          child: const Text("Burger Page", 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          )), 
           Container(
            margin: const EdgeInsets.only(top: 120, left: 40),
          child: const Text("All our Burger", 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          )), 
           SizedBox(
              child: GreyItem(textmiddle: "go back", 
              marginTop: 120,
              marginLeft: 280,
              onTapButton: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MenuPage())
                );
                },),
              ),
          //bloc 
          Row(
            children: <Widget>[
               GestureDetector(
                 onTap: () {
                  openDialiog(context); 
                },
                 child: const ClassicMenuCard(
                             paddingLeft: 20.0, 
                             roundedImg: "images/menuimg/burger/burgir.png",
                             titleFood: "Smash burger",
                             descFood: "Prix item",
                             paddingTop: 170,
                             
                            ),
               ),
    
               GestureDetector(
                 onTap: () {
                  openDialiog(context); 
                },
                 child: const ClassicMenuCard(
                  paddingLeft: 30.0, 
                  roundedImg: "images/menuimg/burger/burger2.png",
                  titleFood: "Low calories burger",
                  descFood: "Prix item",
                  paddingTop: 170,
                             
                  ),
               ),
            ],
          ), 
          Row(
            children: <Widget>[
               GestureDetector(
                 onTap: () {
                  openDialiog(context); 
                },
                 child: const ClassicMenuCard(
                  paddingLeft: 20.0, 
                  roundedImg: "images/menuimg/burger/burger3.png",
                    titleFood: "The savoyard burger",
                    descFood: "Prix item",
                    paddingTop: 325,
                 ),
               ), 
               GestureDetector(
                 onTap: () {
                  openDialiog(context); 
                },
                 child: const ClassicMenuCard(
                             paddingLeft: 30.0, 
                             roundedImg: "images/menuimg/burger/burger4.jpg",
                             titleFood: "Spicy chicken burger",
                             descFood: "Prix item",
                             paddingTop: 325,
                             ),
               ),
            ],
          ), 
          Row(
            children: <Widget>[
               GestureDetector(
                 onTap: () {
                  openDialiog(context); 
                },
                 child: const ClassicMenuCard(
                             paddingLeft: 20.0, 
                             roundedImg: "images/menuimg/burger/burger5.jpg",
                             titleFood: "Classic vegan",
                             descFood: "Prix item",
                             paddingTop: 485,
                             ),
               ),
    
               GestureDetector(
                 onTap: () {
                  openDialiog(context); 
                },
                 child: const ClassicMenuCard(
                             paddingLeft: 30.0, 
                             roundedImg: "images/wrap2.png",
                             titleFood: "Vegan wrap",
                             descFood: "Prix item",
                             paddingTop: 485,
                             ),
               ),
            ],
          ), 
        ],
        ),
    );
  }
}