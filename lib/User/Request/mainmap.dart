import 'package:flutter/material.dart';
import 'emergency.dart';
import 'view-mechanic.dart';
import 'view-mechanic2.dart';
import 'request.dart';
import '../../sidebar/sidebar_button.dart';
import '../../sidebar/car-owner-sidebar/car-owner_sidebar_card.dart';

class MainMap extends StatelessWidget {
  final Map<String, dynamic>? userDetails;

  MainMap({Key? key, this.userDetails}) : super(key: key);
  //final user details chuchu param
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/au-mainmap.png',
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
                  SizedBox(height: 12),
                  Container(
                    width: 273,
                    height: 273,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.11999999731779099),
                      shape: OvalBorder(),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 13,
                          left: 4,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ViewMechanic();
                                },
                              );
                            },
                            child: Image.asset(
                              'assets/au-mechanic-s1.png',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 91,
                          left: 212,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ViewMechanic2();
                                },
                              );
                            },
                            child: Image.asset(
                              'assets/au-mechanic-s2.png',
                            ),
                          ),
                        ),
                        Positioned(
                          left: 121,
                          top: 121,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 83),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return EmergencyDialog();
                            },
                          );
                        },
                        child: Container(
                          width: 59,
                          height: 59,
                          decoration: ShapeDecoration(
                            color: Color(0xFFA4243B),
                            shape: OvalBorder(),
                          ),
                          child: Image.asset(
                            'assets/au-emergency.png', // Adjust height as needed
                          ),
                        ),
                      ),
                      SizedBox(width: 21),
                    ],
                  ),
                  SizedBox(height: 36),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return RequestMechanic();
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
                            'assets/au-request.png', // Adjust height as needed
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
        endDrawer: CarOwnerSidebarCard());
  }
}
