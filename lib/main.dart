import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_students/components/ui_components/navigation_bar.dart';
import 'package:for_students/services/auth/auth_service.dart';
import 'package:for_students/services/crud/services/isar_service.dart';
import 'package:for_students/views/auth/register_page.dart';
import 'package:for_students/views/auth/veify_email_page.dart';
import 'package:for_students/views/user/announcements/add_cr_anouncements_page.dart';
import 'package:for_students/views/user/announcements/editing_announcement.dart';
import 'package:for_students/views/user/announcements/event_announcements.dart';
//import 'package:for_students/views/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final service = IsarService();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/verifyEmail': (context) => const EmailVerifyView(),
        '/register': (context) => const RegisterPage(),
        '/main': (context) => const MyNavigationBar(),
        '/crNotice': (context) => AnnounceToClassView(
              service: service,
            ),
        '/updateNotice': (context) => EditAnnouncementView(
              service: service,
            ),
        '/eventAnnouncement': (context) => AddEventView(
              service: service,
            )
      },
      debugShowCheckedModeBanner: false,
      title: 'myapp',
      home: const HomePage(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AuthService.firebase().initalize(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return const RegisterPage();
            default:
              return const CircularProgressIndicator();
          }
        });
  }
}
