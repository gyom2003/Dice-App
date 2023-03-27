
import 'package:flutter/material.dart';
import '../../scriptRef/clipper.dart'; 
import '../../scriptRef/menuCard.dart'; 
import '../../scriptRef/greyItem.dart'; 
import '../menu.dart';

class DrinkPage extends StatelessWidget {
  const DrinkPage({super.key});

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
          child: const Text("Drink Page", 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          )),
    
          Container(
      
          margin: const EdgeInsets.only(top: 120, left: 40),
            child: const Text("All our Drink", 
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
    
          Row(
            children: <Widget>[
               GestureDetector(
                 onTap: () {
                  openDialiog(context); 
                },
                 child: const ClassicMenuCard(
                             paddingLeft: 20.0, 
                             roundedImg: "images/menuimg/drink/beer.jpg",
                             titleFood: "Beer",
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
                roundedImg: "images/menuimg/drink/expressomartini.jpg",
                titleFood: "Expresso Martini",
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
                             roundedImg: "images/menuimg/drink/manhattan.jpg",
                             titleFood: "Manhattan",
                             descFood: "Prix item",
                             paddingTop: 325,),
               ),
              GestureDetector(
                 onTap: () {
                  openDialiog(context); 
                },
                child: const ClassicMenuCard(
                paddingLeft: 30.0, 
                roundedImg: "images/menuimg/drink/margarita.jpg",
                titleFood: "Margarita",
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
                             roundedImg: "images/menuimg/drink/morito.png",
                             titleFood: "Morito",
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
                roundedImg: "images/menuimg/drink/sprite.png",
                titleFood: "Sprite",
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