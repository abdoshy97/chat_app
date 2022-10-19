import 'package:chat_app/screns/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/wigdt/button.dart';

import 'login.dart';
class Wolcem extends StatefulWidget {
  const Wolcem({Key? key}) : super(key: key);

  @override
  State<Wolcem> createState() => _WolcemState();
}

class _WolcemState extends State<Wolcem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  child: Image.asset("images/logo.png"),
                ),
                Text("HELLO To My Chat App",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,color: Colors.deepOrange,
                ),)
              ],
            ),
            MyBoutton(color: Colors.redAccent, titile: "Sign In", onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Login()));
            }),
            MyBoutton(color: Colors.yellow, titile: "Sign Up", onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>SignUp()));
            }),
          ],
        ),
      ),
    );
  }
}
