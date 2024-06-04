import 'package:flutter/material.dart';
import 'package:for_students/views/user/calender_page.dart';
import 'package:for_students/views/user/home_page.dart';

class MyNavigationBar extends StatefulWidget {
  const  MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int index = 0;
  final screens = [const MainPage(), const CalendarGrid()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.white60,
        selectedIndex: index,
        onDestinationSelected: (index) {
          setState(() {
            this.index = index;
          });
        },
        height: 56,
        backgroundColor: Colors.cyan.shade400,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'events',
          ),
        ],
      ),
    );
  }
}
