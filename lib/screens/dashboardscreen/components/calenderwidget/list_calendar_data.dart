import 'package:flutter/material.dart';
import 'package:smartlab/core/constants/color_constants.dart';
import 'package:smartlab/core/models/data.dart';
import 'package:smartlab/core/widgets/calendar_item.dart';

class ListCalendarData extends StatelessWidget {
  final List<CalendarData> calendarData;

  const ListCalendarData({super.key, required this.calendarData});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: calendarData.asMap().entries.map(
        (data) {
          double bottom;
          bottom = data.key != calendarData.length - 1 ? defaultPadding : 0;
          
          return Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: CalendarItem(
              calendarItemData: data.value,
            ),
          );
        },
      ).toList(),
    );
  }
}
