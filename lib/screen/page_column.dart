import 'package:flutter/material.dart';

class PageColumn extends StatelessWidget {
  const PageColumn({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Page Column'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround, //secar horizontal
          // crossAxisAlignment: CrossAxisAlignment.center, //secar vertikal
          children: [
            Text("Ini Text satu"),
            Text("Ini Text Dua"),
            Text("Ini Text tiga"),
          ],
        ),
      ),
    );
   }
}