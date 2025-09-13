import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // 🔹 Event storage with full details
  final Map<DateTime, List<Map<String, dynamic>>> _events = {
    DateTime(2024, 6, 2): [
      {
        "title": "Write blog post",
        "category": "Work",
        "time": "10:00 AM",
        "priority": "High",
      },
    ],
    DateTime(2024, 6, 7): [
      {
        "title": "Dentist Appointment",
        "category": "Personal",
        "time": "10:00 AM",
        "priority": "Medium",
      },
      {
        "title": "Package Delivery",
        "category": "Work",
        "time": "11:00 AM",
        "priority": "Low",
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    _selectedDay = _normalizeDate(DateTime.now());
  }

  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  List<Map<String, dynamic>> _getEventsForDay(DateTime day) {
    final normalized = _normalizeDate(day);
    return _events[normalized] ?? [];
  }


  // 🔹 Priority color
  Color _getPriorityColor(String priority) {
    switch (priority) {
      case "High":
        return Colors.red;
      case "Medium":
        return Colors.orange;
      case "Low":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  // 🔹 Add Event Dialog
  void _addEvent() async {
    TextEditingController titleController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    TextEditingController timeController = TextEditingController();
    String selectedPriority = "Low";

    final newEvent = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Event"),
          content: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(hintText: "Event Title"),
                ),
                TextField(
                  controller: categoryController,
                  decoration: InputDecoration(hintText: "Category"),
                ),
                TextField(
                  controller: timeController,
                  decoration: InputDecoration(hintText: "Time (e.g. 10:00 AM)"),
                ),
                DropdownButton<String>(
                  value: selectedPriority,
                  isExpanded: true,
                  items: ["High", "Medium", "Low"]
                      .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                      .toList(),
                  onChanged: (val) {
                    if (val != null) {
                      setState(() {
                        selectedPriority = val;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text("Cancel", style: TextStyle(color: Colors.black)),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              child: Text("Add", style: TextStyle(color: Colors.white)),
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  Navigator.pop(context, {
                    "title": titleController.text,
                    "category": categoryController.text.isNotEmpty
                        ? categoryController.text
                        : "General",
                    "time": timeController.text.isNotEmpty
                        ? timeController.text
                        : "--:--",
                    "priority": selectedPriority,
                  });
                }
              },
            ),
          ],
        );
      },
    );

    if (newEvent != null) {
      setState(() {
        final date = _normalizeDate(_selectedDay!);
        if (_events[date] == null) {
          _events[date] = [];
        }
        _events[date]!.add(newEvent);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Calendar",
        onPress: _addEvent,
        trailing: Icons.add,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),

              child: TableCalendar(
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false
                ),
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: CalendarFormat.month,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = _normalizeDate(selectedDay);
                    _focusedDay = focusedDay;
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  todayTextStyle: TextStyle(color: Colors.black),
                  todayDecoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle
                  )
                ),
                eventLoader: _getEventsForDay,
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, date, events) {
                    if (events.isNotEmpty) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: events.map((event) {
                          final Map<String, dynamic> e = event as Map<String, dynamic>;
                          final priority = e["priority"] as String? ?? "Low";

                          Color color;
                          switch (priority) {
                            case "High":
                              color = Colors.red;
                              break;
                            case "Medium":
                              color = Colors.orange;
                              break;
                            case "Low":
                              color = Colors.green;
                              break;
                            default:
                              color = Colors.grey;
                          }

                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 1),
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                            ),
                          );
                        }).toList(),
                      );
                    }
                    return SizedBox();
                  },

                ),
              ),

            ),
            Text("Today"),
            Expanded(
              child: ListView.separated(
                itemCount: _getEventsForDay(_selectedDay!).length,
                separatorBuilder: (_, __) => Divider(color: Colors.grey.shade300),
                itemBuilder: (context, index) {
                  final event = _getEventsForDay(_selectedDay!)[index];
                  final priorityColor = _getPriorityColor(event["priority"]);

                  return ListTile(
                    leading: Icon(Icons.circle, size: 12, color: priorityColor),
                    title: Text(
                      event["title"],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(event["category"]),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(event["time"]),
                        SizedBox(height: 4),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: priorityColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            event["priority"],
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
