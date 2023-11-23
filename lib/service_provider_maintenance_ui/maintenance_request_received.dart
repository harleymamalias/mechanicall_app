import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechanicall_app/payments/payment_page.dart';
import 'package:mechanicall_app/service_provider_maintenance_ui/request_assitance_form_sp.dart';

class MaintenanceRequestReceivedPage extends StatelessWidget {
  const MaintenanceRequestReceivedPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Maintenance Request',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Maintenance Request has been received.'),
              ],
            ),
            actions: [
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const RequestAssistanceFormServiceProvider(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffD8973C),
                  ),
                  child: Text(
                    'View Details',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
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
