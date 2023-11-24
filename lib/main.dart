import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'Calendar_card_static.dart';
import 'app_styles.dart';
import 'car-owner_book_maintenance/car-owner_book_maintenance.dart';
import 'sidebar/service-provider-sidebar/service-provider_sidebar_card.dart';
import 'sidebar/sidebar_button.dart';
import 'size_config.dart';
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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomePage(),
          CarOwnerBookMaintenancePage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xff125670),
        backgroundColor: tCharcoal,
        items: <Widget>[
          Icon(
            Icons.map_outlined,
            size: 30,
            color: tWhite,
          ),
          Icon(
            Icons.calendar_month_outlined,
            size: 30,
            color: tWhite,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

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
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //   ),
            //   onPressed: () async {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => CarOwnerBookMaintenancePage()),
            //     );
            //   },
            //   child: Text("Book Appointment / Schedule Maintenance",
            //       style: tInterSemiBold.copyWith()),
            // ),
            CalendarCard(),
          ],
        ),
        // endDrawer: CarOwnerSidebarCard());
        endDrawer: ServiceProviderSidebar());
  }
}
