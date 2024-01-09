import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_students/components/ui_components/navigation_bar.dart';
import 'package:for_students/services/crud/services/isar_service.dart';
import 'package:for_students/views/auth/register_page.dart';
import 'package:for_students/views/auth/veify_email_page.dart';
import 'package:for_students/views/user/add_ar_anouncements_page.dart';
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
        '/crNotice': (context) => AnnounceToClassView(service: service,),
      },
      debugShowCheckedModeBanner: false,
      title: 'myapp',
      home: const MyNavigationBar(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}
