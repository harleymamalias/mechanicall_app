import 'package:flutter/material.dart';
import 'route2.dart';

class Arrival extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
          return AlertDialog(
            title: const Text('Mechanic Arrival'),
            content: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Mechanic has arrived!'),
                SizedBox(height: 8),
                Text('Service Provider: Noraa Ojenroc'),
                SizedBox(height: 8),
                Text('Phone Number: 09667236231'),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    SizedBox(width: 4),
                    Text('4.8 Rating'),
                  ],
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RouteM2()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff273E47),
                ),
                child: Text(
                  'OK',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                ),
              ),
            ],
          );
        }
  }