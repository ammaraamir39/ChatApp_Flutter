import 'package:flutter/material.dart';
import '../models/message_model.dart';
import '../screen/chat_screen.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Container(
        height:300.0,
      
        decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(30.0),
                    topRight: Radius.circular(30.0)
                    )
          ),
        child:ClipRRect(
            borderRadius:BorderRadius.only(
                    topLeft:Radius.circular(30.0),
                    topRight: Radius.circular(30.0)
                    )
 ,
            child: ListView.builder(
            
            itemCount: chats.length,
            itemBuilder: (BuildContext context , int index){
            final Message chat = chats[index];
                return GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (_)=>ChatScreen(user:chat.sender)
                        ),
                        );
                    },
                    child: Container(
                    margin: EdgeInsets.only(top:5.0,bottom:5.0,right:20.0),
                    padding:EdgeInsets.symmetric(horizontal:20.0,vertical:10.0),
                    decoration:BoxDecoration(
                      color:chat.unread ? Color(0xFFFFEFEE) :Colors.white,
                      borderRadius:BorderRadius.only(
                        topRight:Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius:35.0,
                              backgroundImage: AssetImage(chat.sender.imageUrl)
                            ),
                            SizedBox(width:10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  chat.sender.name,
                                  style: TextStyle(
                                    fontSize:15.0,
                                    color:Colors.grey,
                                    fontWeight:FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: 7.0),
                                Container(
                                  width: MediaQuery.of(context).size.width*0.45,
                                  child: Text(
                                    chat.text,
                                    style: TextStyle(
                                      fontSize:15.0,
                                      color:Colors.blueGrey,
                                      fontWeight:FontWeight.w600
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(chat.time,
                            style:TextStyle(
                              fontSize:15.0,
                              color:Colors.grey,
                              fontWeight:FontWeight.bold,
                            )
                            ),
                            chat.unread ? Container(
                              width:50.0,
                              height:30.0,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color:Theme.of(context).primaryColor,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'NEW',
                                style:TextStyle(
                                  color:Colors.white,
                                  fontSize:15.0,
                                  fontWeight:FontWeight.bold
                                ) 
                                )
                                ):Text(''),
                          ]
                        )
                      ],
                    ),
                  ),
                );
            }),
        )
      ),
    );
  }
}