import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mechanicall_app/login_and_registration/launch_screen.dart';
import 'package:mechanicall_app/payments/arrival_of_mechanic_page.dart';
import 'package:mechanicall_app/service_provider_maintenance_ui/maintenance_request_received.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MechaniCALL',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MaintenanceRequestReceivedPage(),
    );
  }
}
