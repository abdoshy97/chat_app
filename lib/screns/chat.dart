import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final _auth=FirebaseAuth.instance;
  late User signedInUser;
  String? masText;
  final _fierstore=FirebaseFirestore.instance;
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gitUser();
  }
  
  void gitUser(){
    try{
      final user =_auth.currentUser;
      if(user != null){
        signedInUser=user;
        print(signedInUser.email);
      }
    }
    catch(e){
    print(e);
    }
  }
  // void gitData() async{
  //   final ms=await _fierstore.collection('messages').get();
  //   for(var masages in ms.docs ){
  //     print(masages.data());
  //   }
  // }
  void gitData() async{
    await for(var sn in _fierstore.collection('messages').snapshots()){
      for(var maseag in sn.docs){
        print(maseag.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(children: [
          Image.asset('images/logo.png',height: 25,),
          SizedBox(width: 10,),
          Text("AAA")
        ],),
        actions: [IconButton(onPressed: (){
          _auth.signOut();
          Navigator.pop(context);
          // gitData();
        }, icon: Icon(Icons.logout)),
          IconButton(onPressed: (){

          }, icon: Icon(Icons.search)),
        ],
      ),
      body: Container(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
        StreamBuilder<QuerySnapshot>(
          stream:_fierstore.collection('messages').snapshots(),
          builder:(context,snapshot) {
           List<Text> masages= [];
        if (!snapshot.hasData){

        }

          final msg=snapshot.data!.docs;
          for(var ms in msg){
            final te=ms.get('text');
            final se=ms.get('sender');
            final xWigdt=Text('$te - $se');
           masages.add(xWigdt);
          }

            return Column(children: masages,);
          },
        ),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.orange,
                    width: 2
                  )
                )
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,children: [
                  Expanded(child: TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value){
                      masText=value;
                    },
                    decoration: InputDecoration(
                        hintText: "Write your message here...",

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

                  ),
                TextButton(onPressed: (){
                  _fierstore.collection('messages').add({
                    'text':masText,
                    'sender':signedInUser.email
                  });
                }, child: Text("send",
                style: TextStyle(color: Colors.blue[800],
                fontWeight: FontWeight.bold,
                fontSize: 18),

                ))
              ],
              ),
            ),

          ],
        ),)
    );
  }
}
