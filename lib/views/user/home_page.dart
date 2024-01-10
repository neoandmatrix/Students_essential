import 'package:flutter/material.dart';
import 'package:for_students/services/crud/isar_databses/notices.dart';
import 'package:for_students/services/crud/services/isar_service.dart';
import 'package:for_students/views/user/announcements/announcement_cards.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.cyan[100],
      // app bar
      appBar: AppBar(
        backgroundColor: Colors.cyan[400],
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'welcome',
            style: GoogleFonts.bebasNeue(
              fontSize: 30,
              color: Colors.white,
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

        // TODO: IMPLEMENT ACTIONS
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              Icons.person_2_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),

      // drawer
      drawer: const Drawer(
        child: SafeArea(child: Text('hello')),
      ),

// announcement by
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 20.0,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "announcement by cr",
                    style: GoogleFonts.bebasNeue(
                      color: Colors.indigo,
                      fontSize: 35,
                      //fontWeight: FontWeight.w800,
                      shadows: [
                        const Shadow(
                          offset: Offset(2.0, 4.0),
                          blurRadius: 10.0,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/crNotice');
                      },
                      backgroundColor: Colors.lightBlueAccent,
                      elevation: 2,
                      child: const Icon(Icons.edit),
                    ),
                  ),
                )
              ],
            ),
          ),

          SizedBox(
            height: 160,
            child: StreamBuilder<List<Notices>>(
              stream: IsarService().listenToNotices(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  // in case of a continious strem we dont wait for it to complete as it never completes
                  // because it is a stream of continious data

                  case ConnectionState.waiting:
                  case ConnectionState.active:
                    if (snapshot.hasData) {
                      final allAnnouncements =
                          snapshot.data as Iterable<Notices>;
                      return AnnouncementListView(
                          announcements: allAnnouncements);
                    } else {
                      return const CircularProgressIndicator();
                    }
                  default:
                    return const CircularProgressIndicator();
                }
              },
            ),
          ),

          //MUMS NOTICES
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 22),
            child: Text(
              "NOTICES",
              style: GoogleFonts.bebasNeue(
                color: Colors.indigo,
                fontSize: 35,
                shadows: [
                  const Shadow(
                    offset: Offset(2.0, 4.0),
                    blurRadius: 10.0,
                    color: Colors.black12,
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.all(10),
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'test item',
                      style: GoogleFonts.bebasNeue(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // downlaod documents
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "DOWNLOAD DOCUMENTS",
              style: GoogleFonts.bebasNeue(
                color: Colors.indigo,
                fontSize: 35,
                shadows: [
                  const Shadow(
                    offset: Offset(2.0, 4.0),
                    blurRadius: 10.0,
                    color: Colors.black12,
                  ),
                ],
              ),
            ),
          ),

          //search bar
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'ENTER SEMESTER NUMBER',
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.black,
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
