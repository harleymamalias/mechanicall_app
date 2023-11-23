import 'package:flutter/material.dart';
import 'map-route2.dart';
import '../../sidebar/sidebar_button.dart';
import '../../sidebar/car-owner-sidebar/car-owner_sidebar_card.dart';

class Route1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/au-route1.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                SizedBox(height: 77),
                Container(
                  width: 455,
                  height: 455,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 60,
                        left: 59,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Route2()));
                          },
                          child: Image.asset(
                            'assets/au-mechanic-s1.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                      },
                      child: Container(
                        width: 59,
                        height: 59,
                        decoration: ShapeDecoration(
                          color: Color(0xFFBD632F),
                          shape: OvalBorder(),
                        ),
                        child: Image.asset(
                          'assets/au-check.png', // Adjust height as needed
                        ),
                      ),
                    ),
                    SizedBox(width: 21),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    endDrawer: CarOwnerSidebarCard()
    );
  }
}
