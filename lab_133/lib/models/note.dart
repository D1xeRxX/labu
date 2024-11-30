import 'package:hive/hive.dart';

part 'note.g.dart'; // Генерований файл

@HiveType(typeId: 0) // Унікальний ідентифікатор
class Note {
  @HiveField(0)
  final String text;

  @HiveField(1)
  final String date;

  Note({required this.text, required this.date});
}

