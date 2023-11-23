import 'package:flutter/material.dart';

class ViewMechanic2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: 338,
        height: 540,
        color: Color(0xFF273E47),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/au-mechanic-l2.png',
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              'Kuya Josh',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              '0998 765 4321',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              'Motorcycle Mechanic',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              'Certified Engineer 2016',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 9,
            ),
            SizedBox(
              height: 77,
            ),
            Text(
              'Distance: 372 km',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
