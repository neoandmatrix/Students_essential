import 'package:flutter/material.dart';
import 'package:for_students/services/crud/isar_databses/events_data.dart';
import 'package:for_students/services/crud/services/isar_service.dart';
import 'package:google_fonts/google_fonts.dart';

class AddEventView extends StatefulWidget {
  final IsarService service;
  const  AddEventView({super.key, required this.service});

  @override
  State<AddEventView> createState() => _AddEventViewState();
}

class _AddEventViewState extends State<AddEventView> {
  late final TextEditingController _titleOfEvent;
  late final TextEditingController _eventDetails;

  @override
  void initState() {
    _titleOfEvent = TextEditingController();
    _eventDetails = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleOfEvent.dispose();
    _eventDetails.dispose();
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
            'add evenet',
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
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              autofocus: false,
              controller: _titleOfEvent,
              decoration: const InputDecoration(
                hintText: 'TYPE TITLE HERE',
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
              maxLines: 2,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              autofocus: false,
              controller: _eventDetails,
              decoration: const InputDecoration(
                hintText: 'TYPE ABOUT EVENT',
                prefixIcon: Icon(
                  Icons.note,
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
              maxLines: 4,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: FloatingActionButton.extended(
              backgroundColor: Colors.cyan.shade300,
              onPressed: () async {
                if (_titleOfEvent.text.isNotEmpty &&
                    _eventDetails.text.isNotEmpty) {
                  final announcedEvent = Events();
                  announcedEvent.content = _eventDetails.text;
                  announcedEvent.dateAndTimeOfEvent = DateTime.now();
                  announcedEvent.title = _titleOfEvent.text;
                  announcedEvent.eventType = "function";

                  widget.service.putTypeOfEvent(announcedEvent);
                  //Navigator.of(context).pop();
                }
              },
              label: const Text('ADD THE EVENT'),
              icon: const Icon(Icons.done_outline_rounded),
            ),
          )
        ],
      ),
    );
  }
}
