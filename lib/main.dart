import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'login_and_registration/launch_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth_service.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyDmeCR3A57c078NKaChT6XNtT5csACh0NM',
    appId: '1:380160686748:android:ad7de280342c8c68afcb59',
    messagingSenderId: '380160686748',
    projectId: 'mechanicall-mobile-application',
    storageBucket: 'mechanicall-mobile-application.appspot.com'
  ));
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MechaniCALL',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LaunchScreen(),
    );
  }
}
