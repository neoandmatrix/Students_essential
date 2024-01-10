import 'package:flutter/material.dart';
import 'package:for_students/services/crud/isar_databses/notices.dart';
import 'package:for_students/services/crud/services/isar_service.dart';
import 'package:google_fonts/google_fonts.dart';

class AnnounceToClassView extends StatefulWidget {
  final IsarService service;
  const AnnounceToClassView({super.key, required this.service});

  @override
  State<AnnounceToClassView> createState() => _AnnounceToClassViewState();
}

class _AnnounceToClassViewState extends State<AnnounceToClassView> {
  late final TextEditingController _notice;

  @override
  void initState() {
    _notice = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _notice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[400],
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ' announce',
            style: GoogleFonts.bebasNeue(
              fontSize: 35,
              color: Colors.black,
            ),
          ),
        ),
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              autofocus: true,
              controller: _notice,
              decoration: const InputDecoration(
                hintText: 'TYPE ANNOUNCEMENT HERE',
                prefixIcon: Icon(
                  Icons.edit,
                  color: Colors.lightBlue,
                ),
                prefixIconColor: Colors.black,
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
              minLines: 1,
              maxLines: 5,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: FloatingActionButton.extended(
              backgroundColor: Colors.cyan.shade300,
              onPressed: () async {
                if (_notice.text.isNotEmpty) {
                  // ye khan se aayya?
                  widget.service.saveNotice(Notices()..notice = _notice.text);
                }

                Navigator.of(context).pop();
              },
              label: const Text('ADD THE ANNOUNCEMENT'),
              icon: const Icon(Icons.done_outline_rounded),
            ),
          )
        ],
      ),
    );
  }
}
