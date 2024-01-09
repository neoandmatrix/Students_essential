import 'package:flutter/material.dart';
import 'package:for_students/services/crud/isar_databses/notices.dart';

class AnnouncementListView extends StatelessWidget {
  final Iterable<Notices> announcements;

  const AnnouncementListView({
    super.key,
    required this.announcements,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: announcements.length,
      itemBuilder: (context, index) {
        final announcement = announcements.elementAt(index);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  announcement.notice!,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
