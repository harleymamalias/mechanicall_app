import 'package:flutter/material.dart';

class Event {
  String eventType;
  String serviceProviderName;
  String serviceProviderPhoto;
  String email;
  String phoneNumber;
  String location;
  double rating;
  String bookingDescription;
  TimeOfDay bookingTime;
  BookingStatus bookingStatus;

  Event({
    this.eventType = "Appointment",
    this.serviceProviderName = '',
    this.serviceProviderPhoto = '',
    this.email = '',
    this.phoneNumber = '',
    this.location = '',
    this.rating = 3,
    this.bookingDescription = '',
    this.bookingTime = const TimeOfDay(hour: 12, minute: 0),
    this.bookingStatus = BookingStatus.pending,
  });
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

// class Event {
//   final String title;
//   final String description;
  
//   Event(this.title, this.description);
// }
