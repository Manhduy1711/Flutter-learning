import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:midterm_todoapp/models/ToDoItem.dart';
import 'package:midterm_todoapp/widgets/taskdetail.dart';

class ListItem extends StatelessWidget {
  final ToDoItem item;

  const ListItem({required this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskDetail(item: item))
          )
        },
        child: Container(
          constraints: const BoxConstraints(
              minHeight: 40,
              minWidth: double.infinity
          ),

          alignment: Alignment.center,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: item.status == "Expire" ? Colors.red : item.color
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Wrap(
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Offstage(
                                offstage: item.status == "Expire" ? false: true,
                                child: Icon(FontAwesomeIcons.warning, color: Colors.yellow, size: 40,),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Text(
                            item.description,
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w300
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              DateFormat.yMd().format(item.deadlineDay),
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            SizedBox(width: 10,),
                            Text(
                              item.deadlineTime.format(context),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(left: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: item.status == "Expire" ? Colors.red : item.color
                      ),
                      alignment: Alignment.center,
                      child: RotatedBox(
                          quarterTurns: -1,
                          child: Text(item.status,
                            style: const TextStyle(
                                fontSize: 24
                            ),
                          )
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}