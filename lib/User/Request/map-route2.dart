import 'package:flutter/material.dart';
import '../../sidebar/sidebar_button.dart';
import '../../sidebar/car-owner-sidebar/car-owner_sidebar_card.dart';

class Route2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/au-route2.png',
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
                SizedBox(height: 70),
                Container(
                  width: 375,
                  height: 455,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Route2();
                            },
                          );
                        },
                        child: Image.asset(
                          'assets/au-mechanic-s1.png',
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
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Route2();
                          },
                        );
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
