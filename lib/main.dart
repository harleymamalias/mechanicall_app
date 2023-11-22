import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
// import 'package:mechanicall_app/login_and_registration/create_account_options.dart';
import 'package:mechanicall_app/login_and_registration/launch_screen.dart';
import 'package:mechanicall_app/login_and_registration/service_provider_registration.dart';
import 'package:mechanicall_app/widgets/terms_and_conditions.dart';
// import 'package:mechanicall_app/login_and_registration/vehicle_owner_registration.dart';
// import 'package:mechanicall_app/login_and_registration/launch_screen.dart';

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
      home: const ServiceProviderRegistrationPage(),
    );
  }
}
