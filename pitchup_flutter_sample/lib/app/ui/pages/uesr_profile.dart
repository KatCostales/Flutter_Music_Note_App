import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.lightGreen[400],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 60, 
              backgroundImage: AssetImage('assets/profileIcon.png'),
            ),
            Text(
              "Isaac Teo"
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                
              ),
            )
          ],
        ),
      )
    );
  }
}