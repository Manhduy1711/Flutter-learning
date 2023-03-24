import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:midterm_todoapp/models/ToDoItem.dart';
import 'package:midterm_todoapp/models/ToDoList.dart';
import 'package:midterm_todoapp/widgets/components/iconhomepage.dart';
import 'package:midterm_todoapp/widgets/components/listitem.dart';
import 'package:midterm_todoapp/widgets/createtasks.dart';
import 'package:midterm_todoapp/widgets/homepage.dart';
import 'package:midterm_todoapp/widgets/setting.dart';
import 'package:midterm_todoapp/widgets/taskdetail.dart';
GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
ToDoList listdata = ToDoList();

class Homepage extends StatefulWidget {
  late  String? action;
  late ToDoItem? item;


  Homepage() {
    action = null;
    item = null;
  }
  Homepage.withAction({required this.action, required this.item});


  @override
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  TextEditingController searchController = TextEditingController();
  bool _todoToggle = false;
  bool _doneToggle = false;
  bool _expireToggle = false;
  @override
  Widget build(BuildContext context) {
    if(widget.action == "add") {
      widget.action = "";
      listdata.addData(widget.item!);
    }
    if (widget.action == "delete") {
      widget.action = "";
      listdata.removeData(widget.item!);
    }
    if (widget.action == "update") {
      widget.action = "";
      listdata.updateData(widget.item!);
    }
    ToDoList data = ToDoList();
    if (_todoToggle) {
      data.listdata = listdata.classifiedData("To Do");
    } else if (_doneToggle) {
      data.listdata = listdata.classifiedData("Done");
    } else if (_expireToggle) {
      data.listdata = listdata.classifiedData("Expire");
    } else {
      data.listdata = listdata.getData();
    }
    data.listdata = data.searchData(searchController.text);
    searchController.clear();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              child: const Icon(
                Icons.menu_rounded,
                color: Colors.black,
              ),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  backgroundColor: const Color(0xfffbefc9),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
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
                const SizedBox(height: 20,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: const BoxDecoration(
                    color: Color(0xfff5f5f5),
                  ),
                  child: Row(
                    children:  [
                      const Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Icon(FontAwesomeIcons.search, color: Colors.grey,),
                      ),
                      Flexible(
                        child: TextField(
                          controller: searchController,
                          onSubmitted: (_) {
                            setState(() {
                            });

                          },
                          decoration: const InputDecoration(
                              hintText: "Search a task...",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 24),
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
                      GestureDetector(
                        onTap: () => {
                          setState(() {
                            _todoToggle = !_todoToggle;
                            _doneToggle = false;
                            _expireToggle = false;
                          })
                        },
                          child: IconHomepage(status: "To Do",icon: FontAwesomeIcons.list, color: Colors.pink, backgroundColor: const Color(0xfff9c3bf))),
                       GestureDetector(
                           onTap: () => {
                             setState(() {
                               _doneToggle = !_doneToggle;
                               _todoToggle = false;
                               _expireToggle = false;
                             })
                           },
                           child: IconHomepage(status: "Done",icon: FontAwesomeIcons.listCheck, color: Colors.green, backgroundColor: const Color(0xffd3e7d4))),
                      GestureDetector(
                          onTap: () => {
                            setState(() {
                              _expireToggle = !_expireToggle;
                              _todoToggle = false;
                              _doneToggle = false;
                            })
                          },
                          child: IconHomepage(status: "Expire",icon: FontAwesomeIcons.warning, color: Colors.amber, backgroundColor: const Color(0xfff7ebc5))),
                    ],
                  ),
                ),
                Offstage(
                  offstage: listdata.getData().length == 0 ? false : true,
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      "Chúc mừng !!! hiện tại bạn chưa có việc phải làm",
                      style: TextStyle(
                        fontSize: 32,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Column (
                  children: data.getData().reversed.map((item) {
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