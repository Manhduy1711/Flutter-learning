import 'package:flutter/material.dart';

class IconHomepage extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final String status;

  IconHomepage({required this.status,required this.icon, required this.color, required this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Color(0xfff5f5f5),
          borderRadius: BorderRadius.circular(40)
      ),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(20),
              backgroundColor: backgroundColor,
              shape: CircleBorder(
                  side: BorderSide(color: color, width: 3)
              ),
            ),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          SizedBox(height: 10,),
          Text(status, style: TextStyle(fontSize: 24, color: Colors.black),)
        ],
      ),
    );
  }
}