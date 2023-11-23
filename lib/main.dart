import 'package:flutter/material.dart';
import 'app_styles.dart';
import 'car-owner_book_maintenance/car-owner_book_maintenance.dart';
import 'sidebar/service-provider-sidebar/service-provider_sidebar_card.dart';
import 'sidebar/sidebar_button.dart';
import 'size_config.dart';
import 'User/Request/mainmap.dart';
// import 'sidebar/car-owner-sidebar/car-owner_sidebar_card.dart';

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
      home: MainMap(),
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
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SidebarButton(),
                ],
              ),
            ),
            Center(
              child: Text(
                'Main Body',
                style: tInterBold.copyWith(
                  color: tWhite,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CarOwnerBookMaintenancePage()),
                );
              },
              child: Text("Book Appointment / Schedule Maintenance",
                  style: tInterSemiBold.copyWith()),
            ),
          ],
        ),
        // endDrawer: CarOwnerSidebarCard());
        endDrawer: ServiceProviderSidebar()
    );
  }
}
