import 'package:flutter/material.dart';

class BookingAppointmentUIServiceProvider extends StatelessWidget {
  const BookingAppointmentUIServiceProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [Text('Book Maintenance Calendar')],
        ),
      ),
    );
  }
}
