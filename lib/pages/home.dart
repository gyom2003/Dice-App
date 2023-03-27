import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import '../components/flutterMap.dart';
import '../pagesRef/menupage/burgerPage.dart';
import '../scriptRef/cardRef.dart';
import '../scriptRef/clipper.dart';
import '../scriptRef/tile.dart';
// import './scriptRef/clipper.dart';
// import './scriptRef/cardRef.dart';
// import './scriptRef/tile.dart';
// import '../pages/pagesRef/menupage/burgerPage.dart';
// init single card widget

class Deded extends StatelessWidget {
  const Deded({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

final user = FirebaseAuth.instance.currentUser!;
final LatLng location = LatLng(50.787048576391086, -1.0753316772437176);

void signUserOut() {
  FirebaseAuth.instance.signOut();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //listview
    return Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: ClipPath(
              clipper: CustomClipref(),
              child: Container(color: const Color(0xFFE9BD1F)),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 30, left: 40),
              child: Text(
                user.email!,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
          Container(
              margin: const EdgeInsets.only(top: 25, left: 360),
              child: const IconButton(
                onPressed: signUserOut,
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              )),
          Container(
              margin: const EdgeInsets.only(top: 80, left: 40),
              child: const Text(
                "The Event",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              )),

          Container(
            margin: const EdgeInsets.only(top: 100),
            height: 200,
            //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) =>
                    cardReference(item: items[index]),
                separatorBuilder: (context, _) => const SizedBox(width: 10),
                itemCount: 4),
          ),
          //button listTill
          //revoir Listtile SANS Listview

          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Expanded(
                    child: TileComponent(
                      title: "Vegan Wrap",
                      subtitle: "Hight quality soja meat, test it",
                      imageref: Image.asset(
                        "images/wrap2.png",
                        height: 100,
                      ),
                      color: const Color(0xFFE9BD1F),
                      gradient: const Color.fromARGB(255, 227, 192, 69),
                      onTab: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Burgerpage()));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent  )),
                    child: Expanded(
                      child: TileComponent(
                        title: "Low calories Burger",
                        subtitle: "Test our new healthy burger ! ",
                        imageref: Image.asset(
                          "images/burger2.png",
                          height: 100,
                        ),
                        color: const Color(0xFFE9BD1F),
                        gradient: const Color.fromARGB(255, 227, 192, 69),
                        onTab: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Burgerpage()));
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  //top: 300,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent)),
                    child: Expanded(
                      child: TileComponent(
                        title: "mini tortillas",
                        subtitle: "A little hunger ?",
                        imageref: Image.asset(
                          "images/veggie2.png",
                          height: 100,
                        ),
                        color: const Color(0xFFE9BD1F),
                        gradient: const Color.fromARGB(255, 227, 192, 69),
                        onTab: () {},
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 7),
                  height: 150,
                  child: MapWidget(location: location),
                ),
              ],
            ),
          ),
        ],
      ); 
  }
}
