import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          margin: const EdgeInsets.only(top:40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back,size: 40, color: Color(0xff0e0e0b),),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        backgroundColor: Color(0xfffbefc9),
                        shape: const CircleBorder()
                    ),
                  ),
                  Text("Task Detail", style: TextStyle(fontSize: 26),),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(FontAwesomeIcons.solidHeart,size: 28, color: Color(0xff0e0e0b),),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16),
                        backgroundColor: Color(0xfffbefc9),
                        shape: const CircleBorder()
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text("Title", style: TextStyle(fontSize: 26),),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.calendarDays, color: Colors.pinkAccent,),
                        Text("7/4/2022", style: TextStyle(fontSize: 24),)
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.solidClock, color: Colors.pinkAccent,),
                        Text("12:08 PM", style: TextStyle(fontSize: 24),)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Icon(FontAwesomeIcons.solidChartBar, color: Colors.pinkAccent,),
                  Text("Status: ToDo", style: TextStyle(fontSize: 24),)
                ],
              ),
              SizedBox(height: 20,),
              Text("Description", style: TextStyle(fontSize: 30),),
              SizedBox(height: 8,),
              Text("DescriptionDescriptionDescriptionDescriptionDescriptionDescr"
                  "iptionDescriptionDescriptionDescriptionDescriptionDescriptionD"
                  "escriptionDescriptionDescription", style: TextStyle(fontSize: 24),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () => {},
                      child: Text("Done", style: TextStyle(fontSize: 24, color: Colors.black),),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        backgroundColor: Color(0xffc6e4c7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                        )
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () => {},
                      child: Text("Delete", style: TextStyle(fontSize: 24, color: Colors.black),),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        backgroundColor: Color(0xfff9c3bf),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)
                        )
                      ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}