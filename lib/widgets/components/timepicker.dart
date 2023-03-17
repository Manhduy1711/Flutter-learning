import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TimePicker extends StatefulWidget {

  State<TimePicker> createState() => _TimePicker();

}

class _TimePicker extends State<TimePicker>{
  TimeOfDay selectedTime = TimeOfDay.now();
  Future<void> _selectDate(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: selectedTime
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {_selectDate(context)},
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            border: Border.all(
                width: 3.0,
                color: Color(0xFFFAEDC8)
            )
        ),
        child: Row(
          children: [
            Text(selectedTime.format(context), style: TextStyle(color: Colors.grey, fontSize: 16),),
            SizedBox(width: 8,),
            const Icon(Icons.access_alarm_rounded, color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}