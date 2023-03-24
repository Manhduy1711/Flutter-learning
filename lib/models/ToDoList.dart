import 'package:midterm_todoapp/models/ToDoItem.dart';
import 'package:midterm_todoapp/models/ToDoList.dart';

class ToDoList {
  List<ToDoItem> listdata = [];

  void addData(ToDoItem data) {
    listdata.add(data);
  }

  void removeData(ToDoItem data) {
    listdata.remove(data);
  }

  List<ToDoItem> getData() {
    return listdata;
  }

  List<ToDoItem> searchData(String searchWord) {
    return listdata.where((element) => element.title.toLowerCase().contains(searchWord.toLowerCase())).toList();
  }

  List<ToDoItem> classifiedData(String classifiedWord) {
    return listdata.where((element) => element.status.toLowerCase() == classifiedWord.toLowerCase()).toList();
  }

  void updateData(ToDoItem item) {
    listdata[listdata.indexWhere((element) => element == item)].status = "Done";
  }
}