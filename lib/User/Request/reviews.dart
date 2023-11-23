import 'package:flutter/material.dart';

class ViewReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 338,
        height: 700,
        color: Color(0xFF273E47),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Reviews:',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/au-review-1.png',
                ),
                Text(
                  '10/20/23',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            Text(
              'One of the best car mechanics I have ever booked. Pinakalupig sa tanan.',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/au-review-2.png',
                ),
                Text(
                  '10/31/23',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            Text(
              'I was looking around for car mechanics and he gave me the best service ever.',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/au-review-3.png',
                ),
                Text(
                  '11/20/23',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            Text(
              'Highly recommended. One of the best mechanics out there.',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
