import 'package:isar/isar.dart';

part 'notices.g.dart';

@Collection()
class Notices {
  
  Id id = Isar.autoIncrement;
  
  late String? notice;

}


