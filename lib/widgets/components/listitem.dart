import 'package:flutter/material.dart';
import 'package:midterm_todoapp/models/ToDoItem.dart';

class ListItem extends StatelessWidget {
  final ToDoItem item;

  const ListItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () => {print("Duy")},
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
                        color: Color(int.parse("0xff"+ item.color))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                            ),
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
                        Text(
                          item.deadline,
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500
                          ),
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
                          color: Color(int.parse("0xff"+ item.color))
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