import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:midterm_todoapp/models/ToDoItem.dart';
import 'package:midterm_todoapp/widgets/homepage.dart';

class TaskDetail extends StatelessWidget {
  final ToDoItem item;

  TaskDetail({required this.item});
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
                  Offstage(
                    offstage: true,
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      child: const Icon(FontAwesomeIcons.solidHeart,size: 28, color: Color(0xff0e0e0b),),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16),
                          backgroundColor: Color(0xfffbefc9),
                          shape: const CircleBorder()
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text(item.title, style: TextStyle(fontSize: 26),),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.calendarDays, color: Colors.pinkAccent,),
                        Text(DateFormat.yMd().format(item.deadlineDay), style: TextStyle(fontSize: 24),)
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.solidClock, color: Colors.pinkAccent,),
                        Text(item.deadlineTime.format(context), style: TextStyle(fontSize: 24),)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Icon(FontAwesomeIcons.solidChartBar, color: Colors.pinkAccent,),
                  Text("Status: " + item.status, style: TextStyle(fontSize: 24),)
                ],
              ),
              SizedBox(height: 20,),
              Text("Description", style: TextStyle(fontSize: 30),),
              SizedBox(height: 8,),
              Text(item.description, style: TextStyle(fontSize: 24),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: item.status == "Done" || item.status == "Expire" ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
                children: [
                  Offstage(
                    offstage: item.status == "Done" || item.status == "Expire" ? true : false,
                    child: ElevatedButton(
                        onPressed: () => {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Homepage.withAction(action: "update", item: item,))
                          )
                        },
                        child: Text("Done", style: TextStyle(fontSize: 24, color: Colors.black),),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                          backgroundColor: Color(0xffc6e4c7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)
                          )
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Homepage.withAction(action: "delete", item: item,))
                        )
                      },
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