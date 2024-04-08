// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import "package:first_project/services/DatabaseHelper.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_svg/svg.dart";

class Login extends StatelessWidget {
  const Login({super.key});

  void login() async {
    print(await DBHelper.getUsers());
  }

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
                  SizedBox(
                    height: 22,
                  ),
                  Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  SvgPicture.asset("assets/icons/login.svg"),
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.purple[100],
                      borderRadius: BorderRadius.circular(66),
                    ),
                    width: 266,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.purple[800],
                          ),
                          hintText: "Your Email :",
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.purple[100],
                      borderRadius: BorderRadius.circular(66),
                    ),
                    width: 266,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          suffix: Icon(
                            Icons.visibility,
                            color: Colors.purple[900],
                          ),
                          icon: Icon(
                            Icons.lock,
                            color: Colors.purple[800],
                            size: 19,
                          ),
                          hintText: "Password :",
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 106, vertical: 10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27))),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account ? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/signup");
                        },
                        child: Text(
                          "Signup",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
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
              right: 0,
              child: Image.asset(
                "assets/images/login_bottom.png",
                width: 111,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
