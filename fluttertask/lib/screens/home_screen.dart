import 'package:flutter/material.dart';
import 'package:fluttertask/widgets/appBar/app_bar_widget.dart';
import 'package:fluttertask/widgets/cards/note_card_widget.dart';
import 'package:provider/provider.dart';
import 'package:fluttertask/providers/note_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<NoteProvider>(context, listen: false).loadNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppbarWidget(
        title: "Task App",
        fontFamily: 'PatrickHand',
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      body: Consumer<NoteProvider>(
        builder: (context, noteProvider, child) {
          return SingleChildScrollView(
            child: Column(
              children:
                  noteProvider.notes.map((note) {
                    return NoteCardWidget(
                      title: note.title,
                      desc: note.desc,
                      date: note.date,
                    );
                  }).toList(),
            ),
          );
        },
      ),
    );
  }
}
