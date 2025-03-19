import 'package:flutter/material.dart';
import 'package:fluttertask/providers/note_provider.dart';
import 'package:fluttertask/screens/home_screen.dart';
import 'package:fluttertask/screens/my_note_screen.dart';
import 'package:fluttertask/screens/profile_screen.dart';
import 'package:fluttertask/widgets/bottomAppBar/bottom_app_bar_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        title: 'Flutter Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: BottomAppBarWidget(
          pages: [HomeScreen(), MyNoteScreen(), ProfileScreen()],
          icons: [
            Icons.home_outlined,

            Icons.note_outlined,
            Icons.person_outline,
          ],
          activeIcons: [Icons.home, Icons.note, Icons.person],
        ),
      ),
    );
  }
}
