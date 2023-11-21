import 'package:flutter/material.dart';

class Event {
  final String title;
  final String description;
  Event(this.title, this.description);
}

class AppointmentEvent {
  String eventType;
  String serviceProviderName;
  String bookingDescription;
  TimeOfDay bookingTime;
  BookingStatus bookingStatus;

  AppointmentEvent({
    this.eventType = "Appointment",
    required this.serviceProviderName,
    required this.bookingDescription,
    required this.bookingTime,
    required this.bookingStatus,
  });
}

enum BookingStatus {
  pending,
  confirmed,
  completed,
  canceled,
}

class MaintenanceSchedule {
  String eventType;
  String serviceProviderName;
  String maintenanceDescription;
  List<DateTime> maintenanceDates;
  TimeOfDay maintenanceTime;
  MaintenanceStatus maintenanceStatus;

  MaintenanceSchedule({
    this.eventType = "Maintenance",
    required this.serviceProviderName,
    required this.maintenanceDescription,
    required this.maintenanceDates,
    required this.maintenanceTime,
    required this.maintenanceStatus,
  });
}

enum MaintenanceStatus {
  pending,
  scheduled,
  inProgress,
  completed,
  canceled,
}
