import 'package:flutter/material.dart';
import 'package:flutter_tugas1/slicing_ui/costum_buttom.dart';
import 'package:flutter_tugas1/slicing_ui/login_page.dart';
import 'package:flutter_tugas1/slicing_ui/signup_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE95322),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("gambar/img_welcome.png"),
              Center(
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur\n adipiscing elit, sed do eiusmod.",
                ),
              ),
              SizedBox(height: 25),
              CostumButton(
                bgColor: Color(0xffF5CB58),
                labelColor: Color(0xffE95322),
                labelButton: "Log In",
                onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                sizeButton: 0.5,
              ),
              SizedBox(height: 15),
              CostumButton(
                bgColor: Color(0xffF3E9B5),
                labelColor: Color(0xffE95322),
                labelButton: "Sign Up",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
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
