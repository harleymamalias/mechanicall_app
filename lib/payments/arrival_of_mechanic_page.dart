import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechanicall_app/payments/waiting_for_receipt_page.dart';

class ArrivalOfMechanicPage extends StatelessWidget {
  const ArrivalOfMechanicPage({Key? key});

  @override
  Widget build(BuildContext context) {
    bool isServiceDone = false;

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Mechanic Arrival'),
            content: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Mechanic has arrived!'),
                SizedBox(height: 8),
                Text('Service Provider: Norra Ojenroc'),
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
                  Navigator.of(context).pop();
                  isServiceDone = true;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff273E47),
                ),
                child: Text(
                  'OK',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ).then((_) {
        if (isServiceDone) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Service Completion'),
                content: const Text('Is the service done?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xffA4243B),
                    ),
                    child: Text(
                      'No',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WaitingForReceiptPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffD8973C),
                    ),
                    child: Text(
                      'Yes',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
      });
    });

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/vehicle-owner-map.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
