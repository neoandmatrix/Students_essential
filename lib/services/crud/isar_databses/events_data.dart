import 'package:isar/isar.dart';

@Collection()
class Events {
  Id id = Isar.autoIncrement;

  late DateTime dateAndTimeOfEvent;

  late String title;

  late String content;

  
}
