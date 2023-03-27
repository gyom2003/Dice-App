

import 'package:flutter/material.dart';
class ClassicList extends StatelessWidget {
  const ClassicList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          margin: const EdgeInsets.only(top: 325), 
          child: ListView.separated(
            itemCount: 3,
            separatorBuilder: (context, index) => const Divider(), 
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xff764abc),
                        child: Text("G"),
                      ),
                      title: const Text('test text'),
                      subtitle: const Text('test subtitle'),
                      trailing:  IconButton(onPressed: () {}, icon: const Icon(Icons.edit)), 
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xff764abc),
                        child: Text("G"),
                      ),
                      title: const Text('test text'),
                      subtitle: const Text('test subtitle'),
                      trailing:  IconButton(onPressed: () {}, icon: const Icon(Icons.edit)), 
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xff764abc),
                        child: Text("G"),
                      ),
                      title: const Text('test text'),
                      subtitle: const Text('test subtitle'),
                      trailing:  IconButton(onPressed: () {}, icon: const Icon(Icons.edit)), 
                    ),
                ],
              ); 
            },
          ),
        );
  }
}
