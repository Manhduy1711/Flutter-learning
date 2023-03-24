import 'package:flutter/material.dart';
import 'package:midterm_todoapp/models/ToDoItem.dart';
import 'package:midterm_todoapp/widgets/components/colorpicker.dart';
import 'package:midterm_todoapp/widgets/components/datepicker.dart';
import 'package:midterm_todoapp/widgets/components/timepicker.dart';
import 'package:midterm_todoapp/widgets/createtasks.dart';
import 'package:midterm_todoapp/widgets/homepage.dart';

class CreateTask extends StatefulWidget {

  @override
  State<CreateTask> createState() => _CreateTask();
}

class _CreateTask extends State<CreateTask>{
  DateTime? dateTime;
  TimeOfDay? time;
  Color? color;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isTitleValidate = true;
  bool isDesValidate = true;

  ToDoItem item() {
    return ToDoItem(this.titleController.text, this.descriptionController.text, this.dateTime!, this.time!, this.color!);
  }

  void validation () {
    if(titleController.text == "" || descriptionController.text == "") {
      setState(() {
        isTitleValidate = false;
        isDesValidate = false;
      });
    }
    else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homepage.withAction(action: "add", item: item(),))
      );
    }
  }

  void onChangeHanldeTitle () {
    if (titleController.text != "" && isTitleValidate == false) {
      setState(() {
        isTitleValidate = true;
      });
    }
  }

  void onChangeHanldeDes () {
    if (descriptionController.text != "" && isDesValidate == false) {
      setState(() {
        isDesValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top:40),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
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
                      ElevatedButton(
                          onPressed: () {
                            validation();
                          },
                          child: Text("Save", style: TextStyle(color: Colors.black, fontSize: 28),),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            backgroundColor: Color(0xfffbefc9),
                            shape: RoundedRectangleBorder(
                              borderRadius:BorderRadius.circular(16)
                            )
                        ),
                      )
                    ],
                  ),
                SizedBox(height: 20,),
                Text(
                    "Task title",
                    style: TextStyle(
                      color: isTitleValidate == false ? Colors.red : Colors.black,
                      fontSize: 20
                    )
                ),
                SizedBox(height: 10,),
                TextField(
                  onChanged: (_) => {onChangeHanldeTitle()},
                  controller: titleController,
                  decoration: InputDecoration(hintText: "Task title",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide: BorderSide(
                        color: isTitleValidate == false ? Colors.red : Color(0xFFFAEDC8) , width: 3.0,),
                    )
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(flex: 8,child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Date", style: TextStyle(fontSize: 20),),
                        SizedBox(height: 10,),
                        DatePicker( callback: (data) {
                          dateTime = data;
                        },

                        ),
                      ],
                    )),
                    Expanded(flex:1,child: SizedBox(width: 10,)),
                    Expanded(flex: 8, child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Time", style: TextStyle(fontSize: 24),),
                        SizedBox(height: 10,),
                        TimePicker( callback: (data) {
                          time = data;
                        },)
                      ],
                    ))
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                    "Description",
                    style: TextStyle(
                      color: isDesValidate == false ? Colors.red : Colors.black,
                      fontSize: 20
                    ),
                ),
                SizedBox(height: 10,),
                TextField(
                  onChanged: (_) => {onChangeHanldeDes()},
                  controller: descriptionController,
                  minLines: 6,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: "Description",
                      alignLabelWithHint: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(
                            color: isDesValidate == false ? Colors.red : Color(0xFFFAEDC8), width: 3.0,),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                const Text("Color", style: TextStyle(fontSize: 20),),
                ColorPicker( callback: (data) {
                  color = data;
                },)

              ],
            ),
          ),
        ),
      ),
    );
  }

}