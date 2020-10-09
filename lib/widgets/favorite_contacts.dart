import 'package:flutter/material.dart';
import '../models/message_model.dart';
import '../screen/chat_screen.dart';

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
        return   Padding(
          padding:EdgeInsets.symmetric(vertical:10.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                      Text('Favorite Contacts',
                        style: TextStyle(
                          fontSize:18.0,
                          color:Colors.blueGrey,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      IconButton(icon: Icon(Icons.more_horiz,)
                      ,
                      iconSize: 30.0,
                       onPressed: (){})
                      ],),
              ),
              Container(
                height:120.0,
              
                child: ListView.builder(
                  padding: EdgeInsets.only(left:10.0),
                  scrollDirection:Axis.horizontal,
                  itemCount: favoriteContacts.length,
                  itemBuilder: (BuildContext context , int index){
                    return Padding(
                      padding:EdgeInsets.all(10.0),
                      child: GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder:(_)=> ChatScreen(user:favoriteContacts[index])
                            )
                            );
                          },
                          child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              radius:35.0,
                              backgroundImage: AssetImage(favoriteContacts[index].imageUrl),
                            ),
                            SizedBox(height:6.0),
                            Text(
                              favoriteContacts[index].name,
                              style: TextStyle(
                                fontSize:15.0,
                                color:Colors.blueGrey,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4
                              ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
          )
      ],
    ),
        );
  }
}