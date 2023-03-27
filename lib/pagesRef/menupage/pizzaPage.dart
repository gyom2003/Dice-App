import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../scriptRef/clipper.dart'; 
import '../../scriptRef/menuCard.dart'; 
import '../../scriptRef/greyItem.dart'; 
import '../menu.dart';


class Pizzapage extends StatelessWidget {
  const Pizzapage({super.key});

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
          child: const Text("Pizza Page", 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          )), 
           Container(
            margin: const EdgeInsets.only(top: 120, left: 40),
          child: const Text("All our Pizza", 
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
                roundedImg: "images/menuimg/pizza/pizz1.jpg",
                titleFood: "Dice Signatute",
                descFood: "Prix item",
                paddingTop: 170,),
              ),

              GestureDetector(
                 onTap: () {
                  openDialiog(context); 
                },
                child: const ClassicMenuCard(
                paddingLeft: 30.0, 
                roundedImg: "images/menuimg/pizza/pizz2.png",
                titleFood: "The Margerita",
                descFood: "Prix item",
                paddingTop: 170,),
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
                roundedImg: "images/menuimg/pizza/pizz3.jpg",
                titleFood: "Pepperoni",
                descFood: "Prix item",
                paddingTop: 325,),
              ),
              GestureDetector(
                 onTap: () {
                  openDialiog(context); 
                },
                child: const ClassicMenuCard(
                paddingLeft: 30.0, 
                roundedImg: "images/menuimg/pizza/pizz4.jpg",
                titleFood: "The carne",
                descFood: "Prix item",
                paddingTop: 325,),
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
                roundedImg: "images/menuimg/pizza/pizz5.jpg",
                titleFood: "Anchovy Pizza",
                descFood: "Prix item",
                paddingTop: 485,),
              ),
              GestureDetector(
                 onTap: () {
                  openDialiog(context); 
                },
                child: const ClassicMenuCard(
                paddingLeft: 30.0, 
                roundedImg: "images/menuimg/pizza/pizz6.jpg",
                titleFood: "The Calzone",
                descFood: "Prix item",
                paddingTop: 485,),
              ),
            ],
          ), 
        ],
        ),
    );
    
    

  }
}
