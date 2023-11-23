import 'package:flutter/material.dart';
import 'request.dart';
import 'request2.dart';

class ViewAllMechanic extends StatelessWidget {
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Nearby Active Mechanics',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Sort By: Name",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return RequestMechanic2();
                  },
                );
              }, // Image tapped
              child: Image.asset(
                'assets/au-mechanic-r1.png',
              ),
            ),
            Text(
              "End of List",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return RequestMechanic();
                  },
                );
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
