import 'package:flutter/material.dart';
import 'package:for_students/services/crud/isar_databses/notices.dart';
import 'package:for_students/services/crud/services/isar_service.dart';
import 'package:google_fonts/google_fonts.dart';

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
            child: GestureDetector(
              onDoubleTap: () async {
                IsarService().deleteNotice(announcement.id);
              },
              child: Container(
                height: 145,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    style: GoogleFonts.bebasNeue(fontSize: 20),
                      maxLines:4,
                      announcement.notice!,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
