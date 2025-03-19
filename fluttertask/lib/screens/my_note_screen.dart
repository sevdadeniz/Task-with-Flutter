import 'package:flutter/material.dart';
import 'package:fluttertask/function/show_alert_function.dart';
import 'package:fluttertask/models/note_model.dart';
import 'package:fluttertask/screens/add_note_screen.dart';
import 'package:fluttertask/widgets/appBar/app_bar_widget.dart';
import 'package:fluttertask/widgets/buttons/circle_button_widget.dart';
import 'package:fluttertask/widgets/cards/note_card_widget.dart';
import 'package:provider/provider.dart';
import 'package:fluttertask/providers/note_provider.dart';

class MyNoteScreen extends StatefulWidget {
  const MyNoteScreen({super.key});

  @override
  State<MyNoteScreen> createState() => _MyNoteScreenState();
}

class _MyNoteScreenState extends State<MyNoteScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      // ignore: use_build_context_synchronously
      Provider.of<NoteProvider>(context, listen: false).loadNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppbarWidget(
        title: "Notlarım",
        actions: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: CircleButtonWidget(
            icon: Icons.add,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNoteScreen(isEditMode: false),
                ),
              );
            },
          ),
        ),
      ),

      body: Consumer<NoteProvider>(
        builder: (context, noteProvider, child) {
          return SingleChildScrollView(
            child: Column(
              children:
                  noteProvider.notes.asMap().entries.map((entry) {
                    int index = entry.key;
                    Note note = entry.value;

                    return NoteCardWidget(
                      isMyTask: true,
                      title: note.title,
                      desc: note.desc,
                      date: note.date,
                      onPressedDeleteBtn: () {
                        showAlertDialog(
                          context,
                          "Uyarı",
                          "Notu silmek istediğinden emin misin?",
                          () {
                            noteProvider.deleteNote(index);
                            Navigator.pop(context);
                          },
                        );
                      },
                      onPressedeEditBtn: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => AddNoteScreen(
                                  note: note,
                                  isEditMode: true,
                                  index: index,
                                ),
                          ),
                        );
                      },
                    );
                  }).toList(),
            ),
          );
        },
      ),
    );
  }
}
