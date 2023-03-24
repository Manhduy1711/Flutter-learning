import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final Function(DateTime) callback;
  DatePicker({required this.callback});

  State<DatePicker> createState() => _DatePicker();

}

class _DatePicker extends State<DatePicker>{
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    widget.callback(selectedDate);
    return InkWell(
      onTap: () => {_selectDate(context)},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          border: Border.all(
            width: 3.0,
            color: Color(0xFFFAEDC8)
          )
        ),
        child: Row(
          children: [
            Text(DateFormat.yMd().format(selectedDate), style: TextStyle(color: Colors.grey, fontSize: 16),),
            SizedBox(width: 8,),
            const Icon(Icons.calendar_month, color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}