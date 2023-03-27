
import 'package:flutter/material.dart';


class CustomClipref extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - (size.width + 50)); 
    var paternone  = Offset(size.width / 2, size.height - 300); 
    var paterntwo = Offset(size.width, size.height - (size.width - 10));
    path.quadraticBezierTo(paternone.dx, paternone.dy, paterntwo.dx, paterntwo.dy); 
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}