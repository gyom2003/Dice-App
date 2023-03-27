import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {

  const GameCard({
    required this.title, 
    required this.descCard, 
    required this.imagePath, 
    super.key});
  final String title; 
  final String descCard; 
  final String imagePath; 
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width; 
    final height = MediaQuery.of(context).size.height;
    //carré blanc shadow+parent border
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 250,
          width: 270,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent), 
            
          ),
          child: Stack(
            children: [
              Positioned(
                top: 40, 
                child: (
                Material(
                  child: Container(
                    height: 180,
                    width: width*0.9,
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: const BorderRadius.all(Radius.circular(0.0)), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3), 
                          offset: const Offset(-7, 7),
                          blurRadius: 20.0, 
                          spreadRadius: 2.0, 
                        )
                      ]
                    ),
                  ),
                )
              )), 
              //autre
              Positioned(child: (
                Card(
                  elevation: 10.0,
                  shadowColor: Colors.grey.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15) 
                  ),
                  child: Container(
                    height: 160,
                    width: 250, 
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0), 
                      image: DecorationImage(
                      fit: BoxFit.fill, 
                      image: AssetImage(imagePath),  
                    ), 
                    ),
                  ),
                )
              )), 
              Positioned(
                top: 167, 
                left: 30, 
                child: Container( 
                child: Column(
                  children: [
                    Text(title, 
                    style: const TextStyle(
                      fontSize: 17, 
                      color: Color.fromARGB(255, 21, 24, 54), 
                      fontWeight: FontWeight.bold)), 

                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(descCard, 
                      style: const TextStyle(
                        fontSize: 14, 
                        color: Color.fromARGB(255, 32, 36, 81), 
                        fontWeight: FontWeight.w500)),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ],
    );
  }
}