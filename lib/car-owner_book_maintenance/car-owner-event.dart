import 'package:flutter/material.dart';

class AppointmentEvent {
  String serviceProviderName;
  String bookingDescription;
  DateTime bookingDate;
  TimeOfDay bookingTime;
  BookingStatus bookingStatus;

  AppointmentEvent({
    required this.serviceProviderName,
    required this.bookingDescription,
    required this.bookingDate,
    required this.bookingTime,
    required this.bookingStatus,
  });
}

class MaintenanceSchedule {
  String serviceProviderName;
  List<DateTime> maintenanceDates;
  TimeOfDay maintenanceTime;
  MaintenanceStatus maintenanceStatus;

  MaintenanceSchedule({
    required this.serviceProviderName,
    required this.maintenanceDates,
    required this.maintenanceTime,
    required this.maintenanceStatus,
  });
}

enum BookingStatus {
  pending,
  confirmed,
  completed,
  canceled,
}

enum MaintenanceStatus {
  pending,
  scheduled,
  inProgress,
  completed,
  canceled,
}
