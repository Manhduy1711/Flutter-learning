import 'package:flutter/material.dart';
import 'package:midterm_todoapp/widgets/components/colorpicker.dart';
import 'package:midterm_todoapp/widgets/components/datepicker.dart';
import 'package:midterm_todoapp/widgets/components/timepicker.dart';

class CreateTask extends StatelessWidget{
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
                          onPressed: () {},
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
                const Text("Task title"),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(hintText: "Task title",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide: BorderSide(
                        color: Color(0xFFFAEDC8), width: 3.0,),
                    )
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(flex: 8,child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Date"),
                        SizedBox(height: 10,),
                        DatePicker(),
                      ],
                    )),
                    Expanded(flex:1,child: SizedBox(width: 10,)),
                    Expanded(flex: 8, child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Time"),
                        SizedBox(height: 10,),
                        TimePicker()
                      ],
                    ))
                  ],
                ),
                SizedBox(height: 20,),
                const Text("Description"),
                SizedBox(height: 10,),
                TextField(
                  minLines: 6,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: "Description",
                      alignLabelWithHint: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(
                            color: Color(0xFFFAEDC8), width: 3.0,),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                const Text("Color"),
                ColorPicker()

              ],
            ),
          ),
        ),
      ),
    );
  }

}