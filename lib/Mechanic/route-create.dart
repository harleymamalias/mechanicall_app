import 'package:flutter/material.dart';
import'route1.dart';

class RouteCreate extends StatefulWidget {
  @override
  _RouteCreationState createState() => _RouteCreationState();
}

class _RouteCreationState extends State<RouteCreate> {
  @override
  void initState() {
    super.initState();

    // Add a delay before navigating to Route1
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RouteM1()),
      );
    });
  }

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
              'Request Confirmed',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Creating Route...",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 100,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
