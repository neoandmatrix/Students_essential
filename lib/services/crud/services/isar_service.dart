import 'package:for_students/services/crud/isar_databses/notices.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDb();
  }

  Future<void> saveNotice(Notices notice) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.notices.putSync(notice));
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
