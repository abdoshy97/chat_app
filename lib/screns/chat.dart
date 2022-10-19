import 'package:flutter/material.dart';
class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
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
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.logout)),
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
        ],
      ),
      body: Container(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(),
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
                    onChanged: (value){},
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
                TextButton(onPressed: (){}, child: Text("send",
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
