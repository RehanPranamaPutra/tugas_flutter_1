import 'package:flutter/material.dart';

class PageDua extends StatelessWidget {
  const PageDua({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
        backgroundColor: const Color.fromARGB(255, 0, 221, 255),
      ),
      body: Center(child: Text('Ini Page Dua')),
    );
  }
}
