import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatefulWidget {
  String titleTextField;
  int? maxLines = 1;
  final TextEditingController controller;

  TextFieldWidget({
    super.key,
    required this.titleTextField,
    this.maxLines,
    required this.controller,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.titleTextField, style: TextStyle(fontSize: 15)),
        SizedBox(height: 3),
        Container(
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(
              10,
            ), 
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.3),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3), 
              ),
            ],
          ),
          child: TextField(
            maxLines: widget.maxLines,
            controller: widget.controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(
                10,
              ), 
              border: InputBorder.none, 
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1,
                ), 
                borderRadius: BorderRadius.circular(
                  10,
                ), 
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2,
                ), 
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
