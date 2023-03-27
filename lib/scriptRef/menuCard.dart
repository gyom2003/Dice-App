import 'package:flutter/material.dart';

class ClassicMenuCard extends StatelessWidget {
  final double paddingLeft; 
  final double paddingTop; 
  final String roundedImg; 
  final String titleFood; 
  final String descFood; 

  const ClassicMenuCard({
    required this.paddingLeft, 
    required this.roundedImg, 
    required this.titleFood, 
    required this.descFood, 
    required this.paddingTop, 
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.only(left: paddingLeft),
          child: Container(
          width: 170,
          height: 140,
          margin: EdgeInsets.only(top: paddingTop),
          decoration:BoxDecoration(
            color: Colors.white, 
            borderRadius: const BorderRadius.all(Radius.circular(10),),
            border: Border.all(color: Colors.transparent), 
            boxShadow: const [
              BoxShadow(
                blurRadius: 30.0, 
                offset: Offset(-10, -10), 
                color: Colors.white24, 
              ), 
              BoxShadow(
                blurRadius: 30.0, 
                offset: Offset(20, 20 ), 
              color: Color(0xFFA7A9AF), 
              )
            ], 
          ),
          child: Stack(
            children: [
              Center(  
                child: Container(
                  margin: const EdgeInsets.only(top: 60), 
                  child: Text(titleFood, 
                  style: const TextStyle(color: Colors.black,  fontWeight: FontWeight.w600, fontSize: 17)),
                ),
              ),
              Center(
                child: Container(
                  margin:  const EdgeInsets.only(top: 100), 
                  child: Text(descFood, 
                    style: const TextStyle(color: Colors.black,  fontWeight: FontWeight.w400, fontSize: 15), 
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                left: 50,  
                child: CircleAvatar( 
                  backgroundImage: AssetImage(roundedImg), 
                  radius: 40, 
                ),
              ), 
            ],
          )
        ),
        ); 
        
      
  }
}