import 'package:flutter/material.dart';
import '../scriptRef/greyItem.dart'; 
import '../scriptRef/clipper.dart'; 
import '../scriptRef/gameCard.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

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
          child: const Text("Game Page", 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          )), 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              GreyItem(marginLeft: 0, marginTop: 120, textmiddle: "Card Games", onTapButton: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) {
                    return const CardGref(); 
                  })
                ); 
              },),
              GreyItem(marginLeft: 0, marginTop: 120, textmiddle: "Family", onTapButton: (){
                  Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) {
                    return const Familyref(); 
                  })
                );
              },),
              GreyItem(marginLeft: 0, marginTop: 120, textmiddle: "Party Games", onTapButton: (){
                  Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) {
                    return const PartyGref(); 
                  })
                );
              },),
            ],
          ), 
         //suite 
            
        ],
      ),
    );
  }
}

class CardGref extends StatelessWidget {
  const CardGref({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
       children: <Widget>[
         Opacity(opacity: 0.5, child: ClipPath(
          clipper: CustomClipref(),
          child: Container(color: const Color(0xFFE9BD1F)),
        ),), 
        Container(
          margin: const EdgeInsets.only(top: 80, left: 40),
        child: const Text("Game Page", 
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        )), 
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            GreyItem(marginLeft: 0, marginTop: 120, textmiddle: "Card Games", onTapButton: (){}),
            GreyItem(marginLeft: 0, marginTop: 120, textmiddle: "Family", onTapButton: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) {
                  return const Familyref(); 
                })
              );
            },),
            GreyItem(marginLeft: 0, marginTop: 120, textmiddle: "Party Games", onTapButton: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) {
                  return const PartyGref(); 
                })
              );
            },),
          ],
        ), 
         Container(
          margin: const EdgeInsets.only(top: 200), 
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const <Widget> [
               GameCard(imagePath: "images/gameimg/cardgames/AcePlayingCards.jpeg",
              title: "Ace Playing Cards", descCard: "a description of the game",),
               GameCard(imagePath: "images/gameimg/cardgames/ArenaPlayingCards.png",
              title: "Arena Playing Cards", descCard: "a description of the game",),
               GameCard(imagePath: "images/gameimg/cardgames/ColtSuperExpress.jpeg",
              title: "Colt Super Express", descCard: "a description of the game",),
              GameCard(imagePath: "images/gameimg/cardgames/FantasyRealms.jpeg",
              title: "Fantasy Realms", descCard: "a description of the game",),
              GameCard(imagePath: "images/gameimg/cardgames/Regicide.png",
              title: "Regicide", descCard: "a description of the game",),
            ],
          ), 
        )
       ]
    ); 
   
  }
}

class Familyref extends StatelessWidget {
  const Familyref({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: <Widget> [
         Opacity(opacity: 0.5, child: ClipPath(
          clipper: CustomClipref(),
          child: Container(color: const Color(0xFFE9BD1F)),
        ),), 
        Container(
          margin: const EdgeInsets.only(top: 80, left: 40),
        child: const Text("Game Page", 
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        )), 
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            GreyItem(marginLeft: 0, marginTop: 120, textmiddle: "Card Games", onTapButton: (){
               Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) {
                  return const CardGref(); 
                })
              );
            }),
            GreyItem(marginLeft: 0, marginTop: 120, textmiddle: "Family", onTapButton: (){},),
            GreyItem(marginLeft: 0, marginTop: 120, textmiddle: "Party Games", onTapButton: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) {
                  return const PartyGref(); 
                })
              );
            },),
          ],
        ), 
         Container(
          margin: const EdgeInsets.only(top: 200), 
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const <Widget> [
               GameCard(imagePath: "images/gameimg/family/AgeOfWar.jpeg",
              title: "Age Of War", descCard: "a description of the game",),
               GameCard(imagePath: "images/gameimg/family/AskingForTrobils.jpeg",
              title: "Asking For Trobils", descCard: "a description of the game",),
               GameCard(imagePath: "images/gameimg/family/Barenpark.png",
              title: "Barenpark", descCard: "a description of the game",),
              GameCard(imagePath: "images/gameimg/family/DreamCatcher.jpeg",
              title: "Dream Catcher", descCard: "a description of the game",),
              GameCard(imagePath: "images/gameimg/family/TicketToRide.png",
              title: "Ticket To Ride", descCard: "a description of the game",),
            ],
          ), 
        ),
      ],
    );
    
  }
}

class PartyGref extends StatelessWidget {
  const PartyGref({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: <Widget>[
        Opacity(opacity: 0.5, child: ClipPath(
          clipper: CustomClipref(),
          child: Container(color: const Color(0xFFE9BD1F)),
        ),), 
        Container(
          margin: const EdgeInsets.only(top: 80, left: 40),
        child: const Text("Game Page", 
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        )), 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            GreyItem(marginLeft: 0, marginTop: 120, textmiddle: "Card Games", onTapButton: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) {
                  return const CardGref(); 
                })
              ); 
            },),
            GreyItem(marginLeft: 0, marginTop: 120, textmiddle: "Family", onTapButton: (){
                Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) {
                  return const Familyref(); 
                })
              );
            },),
            GreyItem(marginLeft: 0, marginTop: 120, textmiddle: "Party Games", onTapButton: (){},),
          ],
        ),
         Container(
          margin: const EdgeInsets.only(top: 200), 
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const <Widget> [
               GameCard(imagePath: "images/gameimg/partygames/AliceInWordland.jpeg",
              title: "Alice In Wordland", descCard: "a description of the game",),
               GameCard(imagePath: "images/gameimg/partygames/Articulate.jpeg",
              title: "Articulate", descCard: "a description of the game",),
               GameCard(imagePath: "images/gameimg/partygames/CashnGuns.jpeg",
              title: "Cash'n Guns", descCard: "a description of the game",),
              GameCard(imagePath: "images/gameimg/partygames/CrossClues.jpeg",
              title: "Cross Clues", descCard: "a description of the game",),
              GameCard(imagePath: "images/gameimg/partygames/Growl.jpeg",
              title: "Growl", descCard: "a description of the game",),
            ],
          ), 
        ), 
      ],
    );
   
  }
}

