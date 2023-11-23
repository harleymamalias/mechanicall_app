import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'size_config.dart';
import 'app_styles.dart';

class CalendarCard extends StatefulWidget {
  const CalendarCard({super.key});

  @override
  State<CalendarCard> createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: tCharcoal,
      child: Column(
        children: [
          TableCalendar(
            locale: "en_US",
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: tInterBold.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                color: tOrange,
              ),
              leftChevronIcon: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: tWhite, width: 1.5)),
                child: Icon(
                  Icons.chevron_left,
                  color: tWhite,
                ),
              ),
              rightChevronIcon: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: tWhite, width: 1.5)),
                child: Icon(
                  Icons.chevron_right,
                  color: tWhite,
                ),
              ),
            ),
            availableGestures: AvailableGestures.all,
            firstDay: DateTime.utc(2010, 3, 14),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: today,
            onDaySelected: _onDaySelected,
            selectedDayPredicate: (day) => isSameDay(day, today),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: tInterMedium.copyWith(color: tOrange),
              weekendStyle: tInterBold.copyWith(color: tOrange),
            ),
            calendarStyle: CalendarStyle(
              defaultTextStyle: tInterRegular.copyWith(color: tWhite),
              weekendTextStyle: tInterRegular.copyWith(color: tWhite),
              outsideTextStyle: tInterRegular.copyWith(color: tOrange),
              todayDecoration:
                  BoxDecoration(color: tGrey3, shape: BoxShape.circle),
              selectedDecoration:
                  BoxDecoration(color: tOrange, shape: BoxShape.circle),
              markerDecoration:
                  BoxDecoration(color: tWhite, shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }
}
