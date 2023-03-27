import 'package:fapp/components/translator.dart';
import 'package:fapp/pages/admin.dart';
import 'package:fapp/pages/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../components/flutterMap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../pagesRef/game.dart';
import '../pagesRef/menu.dart';
import 'home.dart';

class HomeRef extends StatefulWidget {
  const HomeRef({super.key, required this.title});

  final String title;

  @override
  State<HomeRef> createState() => _HomeRefState();
}

class _HomeRefState extends State<HomeRef> {
  //init
  //navigations part
  int indexref = 0;
  static const TextStyle styleref = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black38);

  static const List<Widget> navref = <Widget>[
    SizedBox(child: HomePage()),
    Text('Index 1:games', style: styleref),
    Text('Index 2:book tables', style: styleref),
    SizedBox(
      child: MenuPage(),
    ),
    SizedBox(
      child: UserScreen(),
    ),
  ];
  bool isFirstPage = true;

  void onTapIcon(int index) {
    setState(() {
      indexref = index;
    });
  }

  void setFirstPage(screenValue) {
    setState(() {
      isFirstPage = screenValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: "home",
              icon: Icon(Icons.home, color: Colors.black),
              backgroundColor: Color(0xFFE9BD1F)),
          BottomNavigationBarItem(
              label: "games",
              icon: Icon(
                Icons.casino,
                color: Colors.black,
              ),
              backgroundColor: Color(0xFFE9BD1F)),
          BottomNavigationBarItem(
              label: "menu",
              icon: Icon(Icons.lunch_dining, color: Colors.black),
              backgroundColor: Color(0xFFE9BD1F)),
          BottomNavigationBarItem(
              label: "account",
              icon: Icon(Icons.account_circle, color: Colors.black),
              backgroundColor: Color(0xFFE9BD1F)),
          BottomNavigationBarItem(
              label: "account",
              icon: Icon(Icons.admin_panel_settings, color: Colors.black),
              backgroundColor: Color(0xFFE9BD1F)),
          BottomNavigationBarItem(
              label: "account",
              icon: Icon(Icons.transcribe, color: Colors.black),
              backgroundColor: Color(0xFFE9BD1F))
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(child: HomePage());
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(child: GamePage());
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(child: MenuPage());
            });
          case 3:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(child: UserScreen());
            });
          case 4:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(child: Admin());
            });
          case 5:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(child: MyTranslator());
            });
          default:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(child: HomePage());
            });
        }
      },
    );
  }

  // final user = FirebaseAuth.instance.currentUser!;
  // final LatLng location = LatLng(50.787048576391086, -1.0753316772437176);

  // void signUserOut() {
  //   FirebaseAuth.instance.signOut();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.grey[300],
  //       title: const Text(
  //         'Dice',
  //         style: TextStyle(color: Colors.black),
  //       ),
  //       actions: [
  //         IconButton(
  //           onPressed: signUserOut,
  //           icon: const Icon(
  //             Icons.logout,
  //             color: Colors.black,
  //           ),
  //         )
  //       ],
  //     ),
  //     body: Column(
  //       children: [
  //         SizedBox(
  //           height: 200,
  //           child: MapWidget(location: location),
  //         ),
  //         Expanded(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Text(
  //                 "LOGGED IN AS: ${user.email!}",
  //                 textAlign: TextAlign.center,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //     bottomNavigationBar: BottomAppBar(
  //       color: Colors.grey[300],
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children: <Widget>[
  //           IconButton(
  //             icon: const Icon(Icons.home),
  //             onPressed: () {
  //               //   Navigator.push(
  //               //       context,
  //               //       MaterialPageRoute(
  //               //           builder: (context) => HomePage));
  //             },
  //           ),
  //           IconButton(
  //             icon: const Icon(Icons.shopping_cart),
  //             onPressed: () {
  //               Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (context) => const OrderScreen()));
  //             },
  //           ),
  //           IconButton(
  //             icon: const Icon(Icons.person),
  //             onPressed: () {
  //               Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (context) => const UserScreen()));
  //             },
  //           ),
  //           IconButton(
  //             icon: const Icon(Icons.admin_panel_settings),
  //             onPressed: () {
  //               Navigator.push(context,
  //                   MaterialPageRoute(builder: (context) => const Admin()));
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  //}
}
