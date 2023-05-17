import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/router/routes.dart';
import '../../../mysql/mysql.dart';

class SignUp extends StatefulWidget{
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var db = Mysql();
  var email = '';
  var password = '';
  var name = '';
  var phone = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child:Center(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
        // Welcome!
        Text(
          'Sign up to Become a Member!',
          style: GoogleFonts.bebasNeue(
            fontSize: 40,
          ),
          textAlign: TextAlign.center,
        ), // Text
          
        SizedBox(height: 50),   // Spacing between words

        // Name Textfield
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color:Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),  //Box Decoration
            child: Padding (
              padding: const EdgeInsets.only(left:20.0),
                child: TextField(
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'First Name',
                    hintStyle: TextStyle(color: Colors.black),
                  ), // InputDecoration
            ), //TextField
           ), //Padding
           ), //Container
        ),  //Padding
 
        SizedBox(height: 20),   // Spacing between words

        // Email Textfield
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color:Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),  //Box Decoration
            child: Padding (
              padding: const EdgeInsets.only(left:20.0),
                child: TextField(
                  onChanged:(value) {
                    email = value;
                  },
                 decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.black),
               ), // InputDecoration
            ), //TextField
           ), //Padding
           ), //Container
        ),  //Padding
 
        SizedBox(height: 20),   // Spacing between words

        // Phone Textfield
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color:Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),  //Box Decoration
            child: Padding (
              padding: const EdgeInsets.only(left:20.0),
                child: TextField(
                  onChanged: (value) {
                    phone = value;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Phone Number',
                  hintStyle: TextStyle(color: Colors.black),
               ), // InputDecoration
            ), //TextField
           ), //Padding
           ), //Container
        ),  //Padding
 

        // Sign up button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
          child: ElevatedButton(
              onPressed: () {
                if (!db.emailExists(email) &&
                    email != '' &&
                    name != '' &&
                    phone != '') {
                  db.addUser(email, password, name, phone);
                  context.go('/page');
                }
              },
              // padding: EdgeInsets.all(25),
              // decoration: BoxDecoration(
              //   color: Colors.lightGreen,
              //   //border: BorderRadius.circular(12),
              // ), // BoxDecoration
              child: Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.green[200],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ), //TextStyle
                ), //Text
              ), //Center
            ), //Container
      ),  //Padding

      SizedBox(height: 10),

      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
              onPressed: () {
                context.go('/');
              },
              child: Text(
                'Back to login',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ), //TextStyle),
              ),
            ), //Text
          ]) // Row
        ]
      ) //Column
        ),  // Center
      ), //SafeArea
    ); // Scaffold
  } // Widget build
} // _LoginScreenState bracket
