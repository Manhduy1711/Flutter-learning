import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:midterm_todoapp/models/ToDoItem.dart';
import 'package:midterm_todoapp/widgets/components/iconhomepage.dart';
import 'package:midterm_todoapp/widgets/components/listitem.dart';
import 'package:midterm_todoapp/widgets/createtasks.dart';
import 'package:midterm_todoapp/widgets/taskdetail.dart';
GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class Homepage extends StatelessWidget {
  List<ToDoItem> dummyList = [
    ToDoItem("title", "description", "12:08PM", "To-Do", "B9F3E4"),
    ToDoItem("title", "description", "12:08PM", "To-Do", "C9F4AA"),
    ToDoItem("title", "description", "12:08PM", "To-Do", "F1F7B5"),
    ToDoItem("title", "description", "12:08PM", "To-Do", "ECA869"),
    ToDoItem("title", "description", "12:08PM", "To-Do", "FF9494"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Builder(
            builder: (context) => ElevatedButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                child: Icon(
                  Icons.menu_rounded,
                  color: Colors.black,
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    backgroundColor: Color(0xfffbefc9),
                    shape: const CircleBorder()
                ),
            ),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 40.0),
          child: Text("ToDo App",
            style: TextStyle(
              fontSize: 28,
              color: Colors.black
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const SizedBox(
              height: 160,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                  color: Color(0xfff5b9ce),
                ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 18.0),
                    child: Text("Duy Hau Kien.",
                    style: TextStyle(
                      fontSize: 32,
                    ),
                    textAlign: TextAlign.center,),
                  ),
            )),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
              },
              leading: const Icon(
                FontAwesomeIcons.house,
                size: 36,
                color: Colors.yellow,
              ),
              title: const Text("Home",
              style: TextStyle(
                fontSize: 24
              ),
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TaskDetail()));
              },
              leading: const Icon(
                FontAwesomeIcons.solidHeart,
                size: 36,
                color: Colors.yellow,
              ),
              title: const Text("Favorite",
                style: TextStyle(
                    fontSize: 24
                ),
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CreateTask()));
              },
              leading: const Icon(
                FontAwesomeIcons.pen,
                size: 36,
                color: Colors.yellow,
              ),
              title: const Text("Create task",
                style: TextStyle(
                    fontSize: 24
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                FontAwesomeIcons.gear,
                size: 36,
                color: Colors.yellow,
              ),
              title: Text("Setting",
                style: TextStyle(
                    fontSize: 24
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        constraints: const BoxConstraints(
          minHeight: double.infinity
        ),

        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                decoration: BoxDecoration(
                  color: Color(0xfff5f5f5),
                ),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 12.0),
                      child: Icon(FontAwesomeIcons.search, color: Colors.grey,),
                    ),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search a task...",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 24)
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconHomepage(icon: FontAwesomeIcons.list, color: Colors.pink, backgroundColor: Color(0xfff9c3bf)),
                    IconHomepage(icon: FontAwesomeIcons.listCheck, color: Colors.green, backgroundColor: Color(0xffd3e7d4)),
                    IconHomepage(icon: FontAwesomeIcons.warning, color: Colors.amber, backgroundColor: Color(0xfff7ebc5)),
                  ],
                ),
              ),
              Column (
                children: dummyList.map((item) {
                  return ListItem(item: item);
                }).toList(),
              ),
            ],
          ),
        )
      ),
    );
  }
}