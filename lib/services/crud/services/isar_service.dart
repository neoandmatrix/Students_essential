import 'package:for_students/services/crud/isar_databses/events_data.dart';
import 'package:for_students/services/crud/isar_databses/notices.dart';
import 'package:for_students/services/crud/services/iasr_exceptions.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

// constructor to open databse
  IsarService() {
    db = openDb();
  }

// announcement related
  Future<void> saveNotice(Notices notice) async {
    final isar = await db;
    isar.writeTxn(() async => await isar.notices.put(notice));
  }

  Future<void> updateNotice(Notices updatedNotice) async {
    final isar = await db;
    isar.writeTxn(() async => await isar.notices.put(updatedNotice));
  }

  Future<void> deleteNotice(int noticeId) async {
    final isar = await db;
    await isar.writeTxn(() async {
      try {
        await isar.notices.delete(noticeId);
      } catch (e) {
        throw CouldNotDeleteAnnouncementException();
      }
    });
  }

// stream
  Stream<List<Notices>> listenToNotices() async* {
    final isar = await db;
    yield* isar.notices.where().watch(fireImmediately: true);
  }

  Future<List<Notices>> getAllNotices() async {
    final isar = await db;
    return await isar.notices.where().findAll();
  }

// events related

// TODO : try to use callback
  Future<void> putEventTitle(Events eventTitle) async {
    final isar = await db;
    isar.writeTxn(() async => await isar.events.put(eventTitle));
  }

  Future<void> putEventDateTime(Events eventDateTime) async {
    final isar = await db;
    isar.writeTxn(() async => await isar.events.put(eventDateTime));
  }

  Future<void> putEventContent(Events eventContent) async {
    final isar = await db;
    isar.writeTxn(() async => await isar.events.put(eventContent));
  }

  Future<void> putTypeOfEvent(Events eventType) async {
    final isar = await db;
    await isar.writeTxn(() async => await isar.events.put(eventType));
  }

  Future<void> printEventTitle(DateTime selectedDateMonthYear) async {
    final isar = await db;
    final requiredEvent = isar.events.where().findFirst();
    (requiredEvent.then((value) => print(value!.title)));
  }

//open database
  Future<Isar> openDb() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [NoticesSchema, EventsSchema],
        directory: dir.path,
        inspector: true,
        name: 'announcement',
      );
    }

    return Future.value(Isar.getInstance('announcement'));
  }
}
