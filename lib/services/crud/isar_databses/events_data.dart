import 'package:isar/isar.dart';

part 'events_data.g.dart';

@Collection()
class Events {
  Id id = Isar.autoIncrement;

  late DateTime dateAndTimeOfEvent;

  late String eventType;

  late String title;

  late String? content;
}
