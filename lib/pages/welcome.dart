// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 22,
                  ),
                  const Text(
                    "Welcome",
                    style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  SvgPicture.asset("assets/icons/chat.svg"),
                  const SizedBox(
                    height: 45,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 79, vertical: 10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27))),
                    ),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/signup");
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.purple[100]),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 77, vertical: 13)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27))),
                    ),
                    child: Text(
                      "SIGNUP",
                      style: TextStyle(fontSize: 17, color: Colors.grey[850]),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_top.png",
                width: 111,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_bottom.png",
                width: 90,
              ),
            )
          ],
        ),
      ),
    );
  }
}
