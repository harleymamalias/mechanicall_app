import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'car-owner_book_maintenance/appointment_functions.dart';
import 'size_config.dart';
import 'app_styles.dart';
import '../car-owner_book_maintenance/car-owner-event.dart';

class CalendarCard extends StatefulWidget {
  const CalendarCard({super.key});

  @override
  State<CalendarCard> createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard> {
  DateTime today = DateTime.now();

  Map<DateTime, List<Event>> events = {};
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  void dispose() {
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEvents.value = _getEventsForDay(selectedDay);
      });
    }
  }

  List<Event> _getEventsForDay(DateTime day) {
    if (day.day == 28) {
      // Example: Appointment on 28th
      Event appointmentEvent = Event(
        eventType: 'Appointment',
        serviceProviderName: 'Harls',
        serviceProviderPhoto: 'assets/images/harls.jpg',
        email: 'harls@example.com',
        phoneNumber: '+123 456 7890',
        location: 'Harls Location',
        rating: 4.5,
        bookingDescription: 'Appointment Description',
        bookingTime: TimeOfDay(hour: 14, minute: 30),
        bookingStatus: BookingStatus.confirmed,
      );
      return [appointmentEvent];
    } else if (day.day == 29) {
      // Example: Maintenance on 29th
      Event maintenanceEvent = Event(
        eventType: 'Maintenance',
        serviceProviderName: 'Harls',
        serviceProviderPhoto: 'assets/images/harls.jpg',
        email: 'harls@example.com',
        phoneNumber: '+123 456 7890',
        location: 'Harls Location',
        rating: 4.5,
        bookingDescription: 'Maintenance Description',
        bookingTime: TimeOfDay(hour: 10, minute: 0),
        bookingStatus: BookingStatus.confirmed,
      );
      return [maintenanceEvent];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical! * 70,
      color: tCharcoal,
      child: Column(
        children: [
          Text("test"),
          TableCalendar(
            eventLoader: _getEventsForDay,
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
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
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
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: _selectedEvents,
                builder: (context, value, _) {
                  return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        Event event = value[index];
                        return GestureDetector(
                          onLongPress: () {
                            _showAppointmentDetailsDialog(context, event);
                          },
                          child: SPEventListItem(
                            eventType: event.eventType,
                            serviceProviderName: event.serviceProviderName,
                            serviceProviderPhoto: event.serviceProviderPhoto,
                            email: event.email,
                            phoneNumber: event.phoneNumber,
                            location: event.location,
                            rating: event.rating,
                            bookingDescription: event.bookingDescription,
                            bookingTime: event.bookingTime,
                            bookingStatus: event.bookingStatus,
                          ),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }

  void _showAppointmentDetailsDialog(BuildContext context, Event event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: tCharcoal,
          title: Text(
            'Appointment Details',
            style: tInterBold.copyWith(color: tWhite),
          ),
          content: SPEventDetailsWidget(
            eventType: event.eventType,
            serviceProviderName: event.serviceProviderName,
            serviceProviderPhoto: event.serviceProviderPhoto,
            email: event.email,
            phoneNumber: event.phoneNumber,
            location: event.location,
            rating: event.rating,
            bookingDescription: event.bookingDescription,
            bookingTime: event.bookingTime,
            bookingStatus: event.bookingStatus,
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: tButterscotch,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: tAmaranthPurple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: () {
                // Remove the appointment from events

                Navigator.pop(context);
              },
              child: Text('Decline Request'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: tOrange,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: () {
                // Remove the appointment from events

                Navigator.pop(context);
              },
              child: Text('Confirm Request'),
            ),
          ],
        );
      },
    );
  }
}

class SPEventDetailsWidget extends StatelessWidget {
  final String eventType;
  final String serviceProviderName;
  final String serviceProviderPhoto;
  final String email;
  final String phoneNumber;
  final String location;
  final double rating;
  final String bookingDescription;
  final TimeOfDay bookingTime;
  final BookingStatus bookingStatus;

  const SPEventDetailsWidget({
    required this.eventType,
    required this.serviceProviderName,
    required this.serviceProviderPhoto,
    required this.email,
    required this.phoneNumber,
    required this.location,
    required this.rating,
    required this.bookingDescription,
    required this.bookingTime,
    required this.bookingStatus,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical! * 40,
      child: ListView(
        children: [
          Container(
            width: SizeConfig.blockSizeVertical! * 20,
            height: SizeConfig.blockSizeHorizontal! * 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: Image.asset(serviceProviderPhoto).image,
                fit: BoxFit.fitHeight,
              ),
              boxShadow: [
                BoxShadow(
                  color: tWhite.withOpacity(0.051),
                  offset: const Offset(0.0, 3.0),
                  blurRadius: 15.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Align(
              alignment: Alignment(0.23, -1.3),
              child: Container(
                width: SizeConfig.blockSizeHorizontal! * 4,
                height: SizeConfig.blockSizeVertical! * 4,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                    border: Border.all(width: 0.8, color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal! * 1,
                    height: SizeConfig.blockSizeVertical! * 1,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Vehicle Owner Name: ',
                    style: tInterBold.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                  TextSpan(
                    text: '${serviceProviderName}',
                    style: tInterRegular.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Phone Number: ',
                    style: tInterBold.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                  TextSpan(
                    text: '${phoneNumber}',
                    style: tInterRegular.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Email: ',
                    style: tInterBold.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                  TextSpan(
                    text: '${email}',
                    style: tInterRegular.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Location: ',
                    style: tInterBold.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                  TextSpan(
                    text: '${location}',
                    style: tInterRegular.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: SizeConfig.blockSizeVertical! * 0.5,
            width: SizeConfig.blockSizeHorizontal! * 0.5,
            color: tButterscotch,
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Event Type: ',
                    style: tInterBold.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                  TextSpan(
                    text: '${eventType}',
                    style: tInterRegular.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Appointment Description: ',
                    style: tInterBold.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                  TextSpan(
                    text: '${bookingDescription}',
                    style: tInterRegular.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Booking Time: ',
                    style: tInterBold.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                  TextSpan(
                    text: '${bookingTime.format(context)}',
                    style: tInterRegular.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Booking Status: ',
                    style: tInterBold.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                  TextSpan(
                    text: '${getBookingStatusString(bookingStatus)}',
                    style: tInterRegular.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SPEventListItem extends StatelessWidget {
  final String eventType;
  final String serviceProviderName;
  final String serviceProviderPhoto;
  final String email;
  final String phoneNumber;
  final String location;
  final double rating;
  final String bookingDescription;
  final TimeOfDay bookingTime;
  final BookingStatus bookingStatus;

  const SPEventListItem({
    required this.eventType,
    required this.serviceProviderName,
    required this.serviceProviderPhoto,
    required this.email,
    required this.phoneNumber,
    required this.location,
    required this.rating,
    required this.bookingDescription,
    required this.bookingTime,
    required this.bookingStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            tCharcoal,
            Color(0xff125670),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.170),
            offset: const Offset(0.0, 3.0),
            blurRadius: 15.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: ListTile(
        onTap: () => print(""),
        title: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: SizeConfig.blockSizeVertical! * 10,
                  height: SizeConfig.blockSizeHorizontal! * 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: Image.asset(serviceProviderPhoto).image,
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: tWhite.withOpacity(0.051),
                        offset: const Offset(0.0, 3.0),
                        blurRadius: 15.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment(0.4, -1.2),
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal! * 2,
                      height: SizeConfig.blockSizeVertical! * 2,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                          border: Border.all(width: 0.8, color: Colors.black)),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          width: SizeConfig.blockSizeHorizontal! * 1,
                          height: SizeConfig.blockSizeVertical! * 1,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  '${serviceProviderName}',
                  style: tInterBold.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                ),
                Text(
                  '${phoneNumber}',
                  style: tInterMedium.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 2),
                ),
                Text(
                  '${email}',
                  style: tInterMedium.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 2),
                ),
              ],
            ),
            SizedBox(
              width: 4,
            ),
            Container(
              width: 2,
              child: SizedBox(
                height: SizeConfig.blockSizeVertical! * 12,
              ),
              decoration: BoxDecoration(color: tButterscotch),
            ),
            SizedBox(
              width: 4,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${eventType}'.toUpperCase(),
                  style: tInterBold.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 4),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Container(
                  width: SizeConfig.blockSizeHorizontal! * 40,
                  child: Text(
                    '${bookingDescription}',
                    style: tInterBold.copyWith(
                        color: tWhite,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Text(
                  'Time: ${bookingTime.format(context)}',
                  style: tInterMedium.copyWith(
                    color: tWhite,
                    fontSize: SizeConfig.blockSizeHorizontal! * 3,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  'Status: ${getBookingStatusString(bookingStatus)}',
                  style: tInterMedium.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Container(
                  width: SizeConfig.blockSizeHorizontal! * 40,
                  child: Text(
                    'Location: ${location}',
                    style: tInterMedium.copyWith(
                        color: tWhite,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
