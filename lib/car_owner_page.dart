import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'User/Request/mainmap.dart';
import 'app_styles.dart';
import 'car-owner_book_maintenance/car-owner_book_maintenance.dart';
import 'sidebar/service-provider-sidebar/service-provider_sidebar_card.dart';
import 'sidebar/sidebar_button.dart';
import 'size_config.dart';

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
          MainMap(),
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
