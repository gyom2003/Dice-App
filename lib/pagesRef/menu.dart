import 'package:flutter/material.dart';
import '../pages/home.dart';
import '../scriptRef/clipper.dart';
import '../scriptRef/menuCard.dart';
import '../pagesRef/menupage/burgerPage.dart';
import '../pagesRef/menupage/dessertpage.dart';
import '../pagesRef/menupage/drinkPage.dart';
import '../pagesRef/menupage/pizzaPage.dart';
import '../scriptRef/greyItem.dart';
import 'package:flutter/cupertino.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.5,
            child: ClipPath(
              clipper: CustomClipref(),
              child: Container(color: const Color(0xFFE9BD1F)),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 80, left: 40),
              child: const Text(
                "Menu Page",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )),
          //list choice item
          Row(
            children: <Widget>[
              GreyItem(
                textmiddle: "Pizza",
                marginTop: 175.0,
                marginLeft: 20.0,
                onTapButton: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Pizzapage()));
                },
              ),
              GreyItem(
                textmiddle: "Burger",
                marginTop: 175.0,
                marginLeft: 20.0,
                onTapButton: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Burgerpage()));
                },
              ),
              GreyItem(
                textmiddle: "Drink",
                marginTop: 175.0,
                marginLeft: 20.0,
                onTapButton: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DrinkPage()));
                },
              ),
              GreyItem(
                textmiddle: "Dessert",
                marginTop: 175.0,
                marginLeft: 20.0,
                onTapButton: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Dessertpage()));
                },
              ),
            ],
          ),
          //Popular items
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              margin: const EdgeInsets.only(top: 190),
              child: const Text("Popular Items",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          //special offer (same in the homepage)
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  openDialiog(context);
                },
                child: const ClassicMenuCard(
                  paddingLeft: 20.0,
                  roundedImg: "images/menuimg/burgir.png",
                  titleFood: "Smash burger",
                  descFood: "Prix item",
                  paddingTop: 270,
                ),
              ),
              const ClassicMenuCard(
                paddingLeft: 30.0,
                roundedImg: "images/menuimg/pizz1.jpg",
                titleFood: "pizza onion,steak",
                descFood: "Prix item",
                paddingTop: 270,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              margin: const EdgeInsets.only(top: 405),
              child: const Text(
                "Our news items",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  openDialiog(context);
                },
                child: const ClassicMenuCard(
                  paddingLeft: 20.0,
                  roundedImg: "images/menuimg/spongecake.jpg",
                  titleFood: "New trifle cake",
                  descFood: "Prix item",
                  paddingTop: 470,
                ),
              ),
              GestureDetector(
                onTap: () {
                  openDialiog(context);
                },
                child: const ClassicMenuCard(
                  paddingLeft: 30.0,
                  roundedImg: "images/menuimg/coffepudding.jpg",
                  titleFood: "New coffe pudding",
                  descFood: "Prix item",
                  paddingTop: 470,
                ),
              ),
            ],
          ),
          //hihih
          SizedBox(
            child: GreyItem(
              textmiddle: "go back",
              marginTop: 690,
              marginLeft: 280,
              onTapButton: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//essayer cupertino design (w class)
openDialiog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: const Text("Purchase pop up",
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: ElevatedButton(
                child: const Text("pay the article",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
        ],
      ),
    ),
  );
}

// Future openmenuPopup(BuildContext context) =>
// showDialog(
//   context: context,
//   builder: (context) =>
//   AlertDialog(
//       title: const Text("Purchase pop up",  style: TextStyle(
//         color: Colors.black,
//         fontSize: 15,
//         fontWeight: FontWeight.bold)),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>  [
//             ElevatedButton(
//               child: const Text("pay the article", style: TextStyle(
//                 color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400,
//               )),
//               onPressed: (){
//                 Navigator.of(context).pop();
//               }),
//           ],
//         ),
//     ),
//   );
