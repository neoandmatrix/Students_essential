import 'package:for_students/services/crud/isar_databses/notices.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

// constructor to open databse
  IsarService() {
    db = openDb();
  }

  Future<void> saveNotice(Notices notice) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.notices.putSync(notice));
  }

  Future<void> deleteNotice(int noticeId) async {
    final isar = await db;
    await isar.writeTxn(() async => await isar.notices.delete(noticeId));
  }

  Stream<List<Notices>> listenToNotices() async* {
    final isar = await db;
    yield* isar.notices.where().watch(fireImmediately: true);
  }

  Future<List<Notices>> getAllCourses() async {
    final isar = await db;
    return await isar.notices.where().findAll();
  }

  Future<Isar> openDb() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [NoticesSchema],
        directory: dir.path,
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
