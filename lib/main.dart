import 'package:flutter/material.dart';
import 'app_styles.dart';
import 'sidebar/sidebar_button.dart';
import 'size_config.dart';
import '../sidebar/car-owner_sidebar_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: tCharcoal),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: tCharcoal,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SidebarButton(),
              ],
            ),
            Center(
              child: Text(
                'Main Body',
                style: tInterBold.copyWith(
                  color: tWhite,
                ),
              ),
            ),
          ],
        ),
        endDrawer: CarOwnerSidebarCard());
  }
}
