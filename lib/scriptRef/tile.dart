import 'package:flutter/material.dart';
import 'dart:developer';

class TileComponent extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget imageref;
  final VoidCallback onTab;
  final Color color;
  final Color gradient;

  const TileComponent(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imageref,
      required this.onTab,
      required this.color,
      required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
      child: GestureDetector(
        onTap: onTab,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            Card(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  gradient: LinearGradient(colors: [
                    Color(0xFFE9BD1F),
                    Color.fromARGB(255, 227, 192, 69)
                  ], begin: Alignment.topCenter, end: Alignment.topLeft),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    subtitle: Text(subtitle,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                ),
              ),
            ),
            const WhiteEff(),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Container(
                child: imageref,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WhiteEff extends StatelessWidget {
  const WhiteEff({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0, right: 30.0),
      child: SizedBox(
        child: Image.asset(
          "images/icon.png",
          height: 95,
        ),
      ),
    );
  }
}
