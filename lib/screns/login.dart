import 'package:flutter/material.dart';
import 'package:chat_app/wigdt/button.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(height: 100,
              child: Image.asset("images/logo.png"),),
            SizedBox(height: 50,),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value){},
              decoration: InputDecoration(
                  hintText: "Enter your Email",
                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.pink,
                          width: 1

                      )
                  )
              ),

            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value){},
              decoration: InputDecoration(
                  hintText: "Enter your Password",
                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.pink,
                          width: 1

                      )
                  )
              ),

            ),
            SizedBox(height: 10,),
            MyBoutton(color: Colors.redAccent, titile: "Login", onPressed: (){})
          ],
        ),),
    );
  }
}
