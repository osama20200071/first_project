// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController studentIdController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController levelController = TextEditingController();

    String? genderValue;
    String? errorMessage;

    void signup() {
      String name = nameController.text;
      String email = emailController.text;
      String studentId = studentIdController.text;
      String password = passwordController.text;
      String confirmPassword = confirmPasswordController.text;
      String level = levelController.text;

      // Validation
      if (name.isEmpty ||
          email.isEmpty ||
          studentId.isEmpty ||
          password.isEmpty ||
          confirmPassword.isEmpty) {
        errorMessage = 'All fields are mandatory.';
      } else if (!email.contains('@stud.fci-cu.edu.eg')) {
        errorMessage = 'Invalid email address.';
      } else if (password.length < 8) {
        errorMessage = 'Password must be at least 8 characters long.';
      } else if (password != confirmPassword) {
        errorMessage = 'Passwords do not match.';
      } else if (!['1', '2', '3', '4'].contains(level)) {
        errorMessage = 'Level must be one of {1, 2, 3, 4}.';
      } else {
        // Sign up successful
        errorMessage = null;
        // Handle signup success
        // For now, just print signup success
        print('Signup success');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Signup success'),
          backgroundColor: Colors.green,
        ));
        return;
      }

      // Signup failed
      print('Signup failed : $errorMessage');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Signup failed: $errorMessage'),
        backgroundColor: Colors.red,
      ));

      return;
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "SIGNUP",
                      style:
                          TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SvgPicture.asset("assets/icons/signup.svg"),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(66),
                      ),
                      width: 266,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: Colors.purple[800],
                            ),
                            hintText: "Your Name :",
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
                        controller: emailController,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.email,
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
                        controller: studentIdController,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.confirmation_number,
                              color: Colors.purple[800],
                            ),
                            hintText: "Your Student ID :",
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
                        controller: levelController,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.format_list_numbered,
                              color: Colors.purple[800],
                            ),
                            hintText: "Your Level (1-4) :",
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
                        controller: passwordController,
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
                        controller: confirmPasswordController,
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
                            hintText: "Confirm Password :",
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            value: 'Male',
                            groupValue: genderValue,
                            onChanged: (value) {
                              genderValue = value.toString();
                            },
                          ),
                          Text('Male'),
                          Radio(
                            value: 'Female',
                            groupValue: genderValue,
                            onChanged: (value) {
                              genderValue = value.toString();
                            },
                          ),
                          Text('Female'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ElevatedButton(
                      onPressed: signup,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                            horizontal: 106, vertical: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      child: Text(
                        "Signup",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account ? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/login");
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    SizedBox(
                      width: 22,
                      height: 21,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/main_top.png",
                  width: 50,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/login_bottom.png",
                  width: 71,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
