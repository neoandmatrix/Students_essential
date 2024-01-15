import 'package:for_students/services/crud/isar_databses/events_data.dart';
import 'package:for_students/services/crud/services/isar_service.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class CalendarGrid extends StatefulWidget {
  const CalendarGrid({Key? key}) : super(key: key);

  @override
  State<CalendarGrid> createState() => _CalendarGridState();
}

class _CalendarGridState extends State<CalendarGrid> {
  late Future<List<Events?>> listOfEventTitles;
  DateTime _selectedDate = DateTime.now();
  int _selectedIndex = 0;
  late int indexOfFirstDayOfTheMonth;

  @override
  void initState() {
    super.initState();
    indexOfFirstDayOfTheMonth =
        getIndexOfFirstDayOfTheMonthOrToday(_selectedDate, false);
    setState(() {
      // logic is increasing the index of first day of taday by 7*week number
      _selectedIndex =
          getIndexOfFirstDayOfTheMonthOrToday(_selectedDate, true) +
              7 * ((_selectedDate.day / 7).floor());
    });
  }

  int numberOfDays() {
    return DateTime(_selectedDate.year, _selectedDate.month + 1, 1)
        .difference(DateTime(_selectedDate.year, _selectedDate.month, 1))
        .inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate =
                  _selectedDate.subtract(Duration(days: numberOfDays()));
              indexOfFirstDayOfTheMonth =
                  getIndexOfFirstDayOfTheMonthOrToday(_selectedDate, false);
            });
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 235, 13, 157),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedDate =
                      _selectedDate.add(Duration(days: numberOfDays()));

                  indexOfFirstDayOfTheMonth =
                      getIndexOfFirstDayOfTheMonthOrToday(_selectedDate, false);
                });
              },
              child: const Icon(
                Icons.arrow_forward,
                color: Color.fromARGB(255, 235, 13, 157),
              ),
            ),
          )
        ],
        title: Center(
          child: Column(
            children: [
              const Text(
                "Calendar",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black),
              ),
              Center(
                child: Text(
                  DateFormat('MMMM yyyy').format(_selectedDate),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                ),
                itemCount: daysOfWeek.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      daysOfWeek[index],
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 207, 17, 17),
                          fontWeight: FontWeight.bold),
                    ),
                  );
                }),
          ),

          // calender starts from here
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 254, 254, 254),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 0.1,
                    blurRadius: 4,
                    offset: const Offset(3, 3),
                  ),
                ]),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemCount: listOfDatesInMonth(_selectedDate).length +
                  indexOfFirstDayOfTheMonth,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    // here the logic is that if the tapped index is greater than index of first day of month then set selected index to that
                    onTap: () => index >= indexOfFirstDayOfTheMonth
                        ? setState(() {
                            _selectedIndex = index;
                            if (index > _selectedIndex) {
                              listOfEventTitles = IsarService().getEventTitle(
                                  _selectedDate.add(Duration(
                                      days: (index - _selectedIndex))));
                            } else if (index < _selectedIndex) {
                              IsarService().getEventTitle(
                                  _selectedDate.subtract(Duration(
                                      days: (_selectedIndex - index))));
                            }
                          })
                        : null,
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            // this line is telling ui that check if the index you are currently building is equal to selected index then give it a special color pink
                            // otherwise leave it transparent
                            color: index == _selectedIndex
                                ? const Color.fromARGB(255, 2, 40, 252)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        child: index < indexOfFirstDayOfTheMonth
                            ? const Text('')
                            : Text(
                                '${index + 1 - indexOfFirstDayOfTheMonth}',
                                style: TextStyle(
                                    color: index == _selectedIndex
                                        ? Colors.white
                                        : (index % 7 == 6) || (index % 7 == 0)
                                            ? const Color.fromARGB(
                                                255, 226, 18, 18)
                                            : Colors.black,
                                    fontSize: 17),
                              )),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 170,
                    width: (MediaQuery.of(context).size.width) * 0.95,
                    padding: const EdgeInsets.only(bottom: 20, top: 8),
                    child: const Center(
                      child: Image(
                          image: AssetImage('lib/assets/images/no_events.jpg')),
                    ),
                  ),
                  Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text('no events today'),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        // TODO : condition based edit and add
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                '/eventAnnouncement',
                              );
                            },
                            backgroundColor: Colors.lightBlueAccent,
                            elevation: 2,
                            child: const Icon(Icons.add),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// function to generate dates of month
// logic is that using date time difference method get the number of days of month then using generate fuction genrate that
List<int> listOfDatesInMonth(DateTime currentDate) {
  var selectedMonthFirstDay =
      DateTime(currentDate.year, currentDate.month, currentDate.day);
  var nextMonthFirstDay = DateTime(selectedMonthFirstDay.year,
      selectedMonthFirstDay.month + 1, selectedMonthFirstDay.day);
  var totalDays = nextMonthFirstDay.difference(selectedMonthFirstDay).inDays;

  var listOfDates = List<int>.generate(totalDays, (i) => i + 1);
  return (listOfDates);
}

int getIndexOfFirstDayOfTheMonthOrToday(
    DateTime currentDate, bool wantIndexOfToday) {
  var selectedMonthFirstDay = DateTime(currentDate.year, currentDate.month,
      wantIndexOfToday ? currentDate.day : 1);
  var day = DateFormat('EEE').format(selectedMonthFirstDay).toUpperCase();

  return daysOfWeek.indexOf(day);
}

final List<String> daysOfWeek = [
  "SUN",
  "MON",
  "TUE",
  "WED",
  "THU",
  "FRI",
  "SAT",
];
