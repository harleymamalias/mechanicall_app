import 'package:flutter/material.dart';

class ViewMechanic extends StatelessWidget {
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
              'assets/au-mechanic-l1.png',
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              'Noraa Ojenroc',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              '0912 345 6789',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              'Car Mechanic',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              'Certified Engineer 2019',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              'View Reviews',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 77,
            ),
            Text(
              'Distance: 490 km',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
