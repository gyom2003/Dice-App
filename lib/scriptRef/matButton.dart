
import 'package:flutter/material.dart';


Widget shadowButton() => 
 Container(
          width: 150,
          height: 50,
          margin: const EdgeInsets.only(top: 370, left: 30),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent), 
            color: const Color(0xFFE7ECEF), 
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                blurRadius: 25,
                offset: Offset(-8, -8), 
                color: Colors.white, 
              ), 
              BoxShadow(
                blurRadius: 25,
                offset: Offset(8, 8),  
                color: Color(0xFFA7A9AF), 
              ), 
            ]
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: 50,
                width: 120,
                decoration: const  BoxDecoration(
                  color: Color(0xFFE9BD1F), 
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10), 
                    topLeft: Radius.circular(10), 
                    bottomRight: Radius.circular(200), 
                  ),
                ),
                child: const Center(
                  child: Text("test button", 
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                  ), 
                ),
              ), 
            const Icon(Icons.home, size: 20), 
            ],
          ),
        ); 