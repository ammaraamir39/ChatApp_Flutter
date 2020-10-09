import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedIndex=0;
  final List<String> categories=['Messages','Online','Groups','Requests'];
  
  @override


  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder:(BuildContext context , int index){
          return GestureDetector(
              onTap: (){
                setState(() {
                  
                  selectedIndex=index;
                });
              },
              child: Padding(
              padding: EdgeInsets.symmetric(horizontal:20.0 , vertical:30.0),
              child: Text(categories[index],
              style: TextStyle(
                color: index == selectedIndex ? Colors.white : Colors.white60,
                fontSize:24.0, 
                fontWeight:FontWeight.bold,
                letterSpacing:1.2
              ),),
            ),
          );
        } ),
    );
  }
}