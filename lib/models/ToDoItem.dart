import 'package:flutter/material.dart';

class ToDoItem {
  var title;
  var description;
  var deadlineDay;
  var deadlineTime;
  var status;
  var color;

  ToDoItem(String title, String description, DateTime deadlineDay, TimeOfDay deadlineTime, Color color) {
    DateTime deadline = DateTime(deadlineDay.year,deadlineDay.month,deadlineDay.day, deadlineTime.hour, deadlineTime.minute);
    this.title = title;
    this.description = description;
    this.deadlineDay = deadlineDay;
    this.deadlineTime = deadlineTime;
    this.status = deadline.isAfter(DateTime.now()) ? "To Do" : "Expire";
    this.color = color;
  }
}