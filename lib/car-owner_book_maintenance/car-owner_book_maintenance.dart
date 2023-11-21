import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../sidebar/car-owner_sidebar_card.dart';
import 'package:table_calendar/table_calendar.dart';
import '../sidebar/sidebar_button.dart';
import '../size_config.dart';
import 'car-owner-event.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'service_provider_card.dart';
// import 'package:file_picker/file_picker.dart';

class CarOwnerBookMaintenancePage extends StatefulWidget {
  const CarOwnerBookMaintenancePage({super.key});
  @override
  State<CarOwnerBookMaintenancePage> createState() =>
      _CarOwnerBookMaintenancePageState();
}

class _CarOwnerBookMaintenancePageState
    extends State<CarOwnerBookMaintenancePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<AppointmentEvent>> appointmentEvents = {};
  Map<DateTime, List<MaintenanceSchedule>> MaintenanceEvents = {};

  @override
  // void initState(){
  //   super.initState();
  //   _selectedDay = _focusedDay;
  //   _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
  // }

  void dispose() {
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  Center(
                    child: Text(
                      'Book',
                      style: tInterRegular.copyWith(
                        fontWeight: FontWeight.w600,
                        color: tWhite,
                        fontSize: SizeConfig.blockSizeHorizontal! * 5,
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal! * 25,
                    height: SizeConfig.blockSizeVertical! * 7.5,
                    child: SidebarButton(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8.0),
                child: TableCalendar(
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
                  ),
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ServiceProviderCard(
                      serviceProviderName: 'Manoy Mexl',
                      serviceProviderPhoto: 'assets/images/meksel.jpg',
                      serviceProviderSpecialties:
                          'Fixing Tires, Fixing Batteries',
                      email: 'ManoyMexl@sample.com',
                      phoneNumber: '+123 456 7890',
                      location: "San Fernando City, Cebu",
                      certifications: [
                        'Certification1',
                        'Certification2',
                        'Certification3'
                      ],
                    ),
                    ServiceProviderCard(
                      serviceProviderName: 'Machew D Alcs',
                      serviceProviderPhoto: 'assets/images/machew.png',
                      serviceProviderSpecialties:
                          'Repairs Breaks, Suspensions and many other technicalities',
                      email: 'machewdalcs@sample.com',
                      phoneNumber: '+456 123 0987',
                      location: "Argao City, Cebu",
                      certifications: [
                        'Certification1',
                        'Certification2',
                        'Certification3'
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: tOrange,
            onPressed: () async {
              // showDialog(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return AddEventDialog();
              //   },
              // );
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
}
