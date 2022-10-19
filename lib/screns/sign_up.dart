import 'package:flutter/material.dart';
import 'package:chat_app/wigdt/button.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'chat.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth=FirebaseAuth.instance;
   late String email;
  late String password;
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
            keyboardType: TextInputType.emailAddress,
            onChanged: (value){
              email=value;
            },
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
            obscureText: true,
            onChanged: (value){
              password=value;
            },
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
          MyBoutton(color: Colors.yellow, titile: "Sign Up", onPressed: ()async{
           try{
             final newUser=await _auth.createUserWithEmailAndPassword(email: email, password: password);
             Navigator.push(context,
                 MaterialPageRoute(builder: (context)=>ChatRoom()));
           }
               catch(e){
             print(e);
               }
          })
        ],
      ),),
    );

  }
}
