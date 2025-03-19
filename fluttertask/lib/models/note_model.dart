import 'package:intl/intl.dart';

class Note {
  late String title;
  late String desc;
  late String date;

  Note({required this.title, required this.desc, required this.date});

  Note.withCurrentDate({required this.title, required this.desc})
    : date = DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now());

  Map<String, dynamic> toMap() {
    return {'title': title, 'desc': desc, 'date': date};
  }

  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'] ?? '',
      desc: map['desc'] ?? '',
      date: map['date'] ?? '',
    );
  }
}
