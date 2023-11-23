import 'package:flutter/material.dart';

enum BookingStatus {
  pending,
  confirmed,
  completed,
  canceled,
}

class Event {
  String eventType;
  String vehicleOwnerName;
  String vehicleOwnerPhto;
  String email;
  String phoneNumber;
  String location;
  String bookingDescription;
  TimeOfDay bookingTime;
  BookingStatus bookingStatus;

  Event({
    this.eventType = "Appointment",
    this.vehicleOwnerName = '',
    this.vehicleOwnerPhto = '',
    this.email = '',
    this.phoneNumber = '',
    this.location = '',
    this.bookingDescription = '',
    this.bookingTime = const TimeOfDay(hour: 12, minute: 0),
    this.bookingStatus = BookingStatus.pending,
  });
}