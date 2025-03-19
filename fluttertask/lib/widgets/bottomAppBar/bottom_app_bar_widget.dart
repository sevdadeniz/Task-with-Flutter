// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BottomAppBarWidget extends StatefulWidget {
  final List<Widget> pages;
  final List<IconData> icons;
  final List<IconData> activeIcons;

  const BottomAppBarWidget({
    super.key,
    required this.pages,
    required this.icons,
    required this.activeIcons,
  });

  @override
  // ignore: library_private_types_in_public_api
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 1,
        height: 60,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(widget.icons.length, (index) {
            return IconButton(
              icon: Icon(
                _currentIndex == index
                    ? widget.activeIcons[index]
                    : widget.icons[index],

                size: 28,
                color: Colors.deepPurple,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = index;
                });
              },
            );
          }),
        ),
      ),
    );
  }
}
