import 'package:flutter/material.dart';
import 'package:smartlab/core/models/data.dart';
import 'package:smartlab/core/widgets/wrapper.dart';
import 'package:smartlab/screens/dashboardscreen/components/calenderwidget/list_calendar_data.dart';

class CalendartList extends StatelessWidget {
  final List<CalendarData> datas;

  const CalendartList({super.key, required this.datas});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: datas.isEmpty ? _Empty() : _List(list: datas),
    );
  }
}

class _Empty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'There is no events.',
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}

class _List extends StatelessWidget {
  final List<CalendarData> list;

  const _List({required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Upcoming events"),
        const SizedBox(height: 8),
        Wrapper(child: ListCalendarData(calendarData: list)),
      ],
    );
  }
}
