
import 'package:flutter/material.dart';


class GreyItem extends StatefulWidget {
  final String textmiddle;  
  final VoidCallback onTapButton; 
  final double marginTop; 
  final double marginLeft; 
  const GreyItem({
    super.key, 
    required this.textmiddle, 
    required this.onTapButton,
    required this.marginTop, 
    required this.marginLeft,  
    });

  @override
  State<GreyItem> createState() => _GreyItemState();
}

class _GreyItemState extends State<GreyItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTapButton,
      child: Container(
        margin: EdgeInsets.only(top: widget.marginTop, left: widget.marginLeft),
        width: 80,
        height: 33,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)), 
          color: Color.fromARGB(255, 205, 215, 224), 
        ),
        child: Center(
          child: Text(widget.textmiddle, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),),
        ),
      ),
    );
  }
}
