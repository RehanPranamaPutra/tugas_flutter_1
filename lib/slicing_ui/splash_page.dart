import 'package:flutter/material.dart';
import 'package:flutter_tugas1/slicing_ui/costum_buttom.dart';
import 'package:flutter_tugas1/slicing_ui/welcome_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5CB58),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("gambar/img_splash.png"),
              SizedBox(height: 15),
              CostumButton(
                bgColor: Color(0xffF3E9B5),
                labelColor: Color(0xffE95322),
                labelButton: "MUlai",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomePage()),
                  );
                },
                sizeButton: 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
