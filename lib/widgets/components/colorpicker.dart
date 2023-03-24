
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef void OnColorChoose(Color color);

class CircleColor extends StatelessWidget{
  bool isSelected;
  final Color color;
  final OnColorChoose? onColorChoose;


  CircleColor({required this.color, this.isSelected = false, this.onColorChoose});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onColorChoose != null ? () => onColorChoose!(color) : null,
      child: CircleAvatar(
      backgroundColor: color,
      child: isSelected ? Icon(FontAwesomeIcons.check,size: 30, color: Colors.black) : null,
    )
    );
  }
}

class ColorPicker extends StatefulWidget {
  final Function(Color) callback;
  ColorPicker({required this.callback});
  @override
  State<ColorPicker> createState() => _ColorPicker();
}

class _ColorPicker extends State<ColorPicker> {

  List<Color> colors = [
    Color(0xFFFFFF99),
    Color(0xFFCCFFFF),
    Color(0xFFCCFF99),
    Color(0xFFFFCCFF),
    Color(0xFFCCCCFF),
    Color(0xFFAFD788),
    Color(0xFF67BF7F),
    Color(0xFF98D0B9),
    Color(0xFFC57CAC),
    Color(0xFFAA87B8),
  ];
  Color _mainColor = Color(0xFFFFFF99);
  void _onColorChoose(Color color) {
    setState(() {
      _mainColor = color;
    });
  }
  @override
  Widget build(BuildContext context) {
    widget.callback(_mainColor);
    return GridView.count(
      crossAxisCount: 5,
      shrinkWrap: true,
      crossAxisSpacing: 20,
      mainAxisSpacing: 10,
      children: colors.map((color) => CircleColor(
        color: color,
        isSelected: _mainColor == color,
        onColorChoose: (_)=> _onColorChoose(color),
      )).toList(),
    );
  }
}