import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../sidebar/car-owner-sidebar/car-owner_sidebar_card.dart';
import 'package:table_calendar/table_calendar.dart';
import '../sidebar/sidebar_button.dart';
import '../size_config.dart';
import 'car-owner-event.dart';
import 'service_provider_card.dart';
import 'appointment_functions.dart';
import 'appointment_list_card.dart';

class CarOwnerBookMaintenancePage extends StatefulWidget {
  const CarOwnerBookMaintenancePage({super.key});
  @override
  State<CarOwnerBookMaintenancePage> createState() =>
      _CarOwnerBookMaintenancePageState();
}

class _CarOwnerBookMaintenancePageState
    extends State<CarOwnerBookMaintenancePage> {
  //sselected service provider diri
  String? _selectedServiceProvider;
  String? _selectedServiceProviderPhoto;
  String? _selectedServiceProviderEmail;
  String? _selectedServiceProviderPhoneNumber;
  String? _selectedServiceProviderLocation;
  double? _selectedServiceProviderRating;

  TimeOfDay? _selectedTime; //time
  late final ValueNotifier<TimeOfDay?> _selectedTimeNotifier; //time
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> events = {};
  Map<DateTime, List<AppointmentEvent>> appointmentEvents = {};
  Map<DateTime, List<MaintenanceSchedule>> MaintenanceEvents = {};
  TextEditingController _eventController = TextEditingController();

  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    _selectedTimeNotifier = ValueNotifier(_selectedTime);
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
    //retrieve all event from the selected day
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: tCharcoal,
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: SizeConfig.blockSizeHorizontal! * 25,
                    height: SizeConfig.blockSizeVertical! * 7.5,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: SizeConfig.blockSizeHorizontal! * 7.5,
                          color: tWhite,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Book Now',
                        style: tInterRegular.copyWith(
                          fontWeight: FontWeight.w600,
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 5,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal! * 20,
                    child: SidebarButton(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8.0),
                child: TableCalendar(
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
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  firstDay: DateTime.utc(2010, 3, 14),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  onDaySelected: _onDaySelected,
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
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Center(
                        child: Text(
                      "Appointments / Maintenance Schedules",
                      style: tInterBold.copyWith(color: tWhite),
                    )),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 1.5,
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
                                      _showAppointmentDetailsDialog(
                                          context, event);
                                    },
                                    child: EventListItem(
                                      eventType: event.eventType,
                                      serviceProviderName:
                                          event.serviceProviderName,
                                      serviceProviderPhoto:
                                          event.serviceProviderPhoto,
                                      email: event.email,
                                      phoneNumber: event.phoneNumber,
                                      location: event.location,
                                      rating: event.rating,
                                      bookingDescription:
                                          event.bookingDescription,
                                      bookingTime: event.bookingTime,
                                      bookingStatus: event.bookingStatus,
                                    ),
                                  );
                                });
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: tOrange,
            onPressed: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: Text("Add Event"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: tCharcoal,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            _showAppointmentForm();
                          },
                          child: Text("Appointment"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: tEcru,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            _showMaintenanceForm();
                          },
                          child: Text("Maintenance"),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Icon(
              Icons.add,
              color: tWhite,
            ),
          ),
          endDrawer: CarOwnerSidebarCard(),
        ),
      ),
    );
  }

  void _showAppointmentForm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Appointment"),
          content: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: SizeConfig.blockSizeVertical! * 50,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Select Service Provider:",
                            style: tInterBold.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 4)),
                        Container(
                          height: SizeConfig.blockSizeVertical! * 16,
                          child: ListView(
                            children: [
                              ServiceProviderCard(
                                serviceProviderName: 'Manoy Mexl',
                                serviceProviderPhoto:
                                    'assets/images/meksel.jpg',
                                serviceProviderSpecialties:
                                    'Fixing Tires, Fixing Batteries',
                                email: 'ManoyMexl@sample.com',
                                phoneNumber: '+123 456 7890',
                                location: "San Fernando City, Cebu",
                                certifications: [
                                  'assets/images/cert2.png',
                                  'assets/images/cert1.png',
                                  'assets/images/cert1.png'
                                ],
                                rating: 4.5,
                                isSelected:
                                    'Manoy Mexl' == _selectedServiceProvider,
                                onServiceProviderSelected:
                                    _updateSelectedServiceProvider,
                              ),
                              ServiceProviderCard(
                                serviceProviderName: 'Machew D Alcs',
                                serviceProviderPhoto:
                                    'assets/images/machew.png',
                                serviceProviderSpecialties:
                                    'Repairs Breaks, Suspensions and many other technicalities',
                                email: 'machewdalcs@sample.com',
                                phoneNumber: '+456 123 0987',
                                location: "Argao City, Cebu",
                                certifications: [
                                  'assets/images/cert1.png',
                                  'assets/images/cert2.png',
                                  'assets/images/cert1.png'
                                ],
                                rating: 3.5,
                                isSelected:
                                    'Machew D Alcs' == _selectedServiceProvider,
                                onServiceProviderSelected:
                                    _updateSelectedServiceProvider,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _selectTime(context);
                          },
                          child: Text(
                            "Select Time",
                            style: tInterMedium,
                          ),
                        ),
                        ValueListenableBuilder<TimeOfDay?>(
                          valueListenable: _selectedTimeNotifier,
                          builder: (context, selectedTime, _) {
                            if (selectedTime != null) {
                              return Text(
                                'Selected Time: ${selectedTime.format(context)}',
                                style: tInterSemiBold.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 3.5,
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: "Appointment Description",
                              labelStyle: tInterSemiBold.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 3.5)),
                          controller: _eventController,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: tOrange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {
                  DateTime selectedDay = _selectedDay!;
                  Event newAppointment = Event(
                    eventType: 'appointment',
                    serviceProviderName: _selectedServiceProvider ?? '',
                    serviceProviderPhoto: _selectedServiceProviderPhoto ?? '',
                    email: _selectedServiceProviderEmail ?? '',
                    phoneNumber: _selectedServiceProviderPhoneNumber ?? '',
                    location: _selectedServiceProviderLocation ?? '',
                    rating: _selectedServiceProviderRating ?? 0.0,
                    bookingDescription: _eventController.text,
                    bookingTime:
                        _selectedTime ?? TimeOfDay(hour: 12, minute: 0),
                    bookingStatus: BookingStatus.pending,
                  );

                  if (events.containsKey(selectedDay)) {
                    events[selectedDay]!.add(newAppointment);
                  } else {
                    events[selectedDay] = [newAppointment];
                  }
                  setState(() {
                    _selectedDay = selectedDay;
                    _selectedEvents.value = _getEventsForDay(selectedDay);
                    _selectedServiceProvider =
                        null; // Clear the selected service provider
                  });

                  Navigator.of(context).pop();
                },
                child: Text("Add Appointment")),
          ],
        );
      },
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
          content: EventDetailsWidget(
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
                setState(() {
                  events[_selectedDay!]!.remove(event);
                  _selectedEvents.value = _getEventsForDay(_selectedDay!);
                });
                Navigator.pop(context);
              },
              child: Text('Cancel Request'),
            ),
          ],
        );
      },
    );
  }

  void _updateSelectedServiceProvider(
      String serviceProviderName,
      String serviceProviderPhoto,
      String email,
      String phoneNumber,
      String location,
      double rating) {
    setState(() {
      if (_selectedServiceProvider == serviceProviderName) {
        _selectedServiceProvider = null;
      } else {
        _selectedServiceProvider = serviceProviderName;
        _selectedServiceProviderPhoto = serviceProviderPhoto;
        _selectedServiceProviderEmail = email;
        _selectedServiceProviderPhoneNumber = phoneNumber;
        _selectedServiceProviderLocation = location;
        _selectedServiceProviderRating = rating;
      }
    });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _selectedTimeNotifier.value = picked;
      });
    }
  }

  void _showMaintenanceForm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Maintenance"),
        );
      },
    );
  }
}
