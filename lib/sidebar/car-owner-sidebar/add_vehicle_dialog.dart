import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../app_styles.dart';

class AddVehicleDialog extends StatefulWidget {
  @override
  _AddVehicleDialogState createState() => _AddVehicleDialogState();
}

class _AddVehicleDialogState extends State<AddVehicleDialog> {
  late String make;
  late String model;
  late String year;
  late String licensePlate;

  Future<void> _addVehicle() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Add vehicle to Firestore under the 'vehicles' subcollection
        await FirebaseFirestore.instance
            .collection('car_owners')
            .doc(user.uid)
            .collection('vehicles')
            .add({
          'make': make,
          'model': model,
          'year': year,
          'licensePlate': licensePlate,
        });
        Navigator.pop(context);
      }
    } catch (e) {
      print('Error adding vehicle: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Add Vehicle',
        style: tInterBold,
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                make = value;
              },
              decoration: InputDecoration(
                labelText: 'Make',
                labelStyle: tInterSemiBold,
              ),
            ),
            TextField(
              onChanged: (value) {
                model = value;
              },
              decoration: InputDecoration(
                labelText: 'Model',
                labelStyle: tInterSemiBold,
              ),
            ),
            TextField(
              onChanged: (value) {
                year = value;
              },
              decoration: InputDecoration(
                labelText: 'Year',
                labelStyle: tInterSemiBold,
              ),
            ),
            TextField(
              onChanged: (value) {
                licensePlate = value;
              },
              decoration: InputDecoration(
                labelText: 'License Plate',
                labelStyle: tInterSemiBold,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel', style: tInterSemiBold),
        ),
        ElevatedButton(
          onPressed: _addVehicle,
          child: Text('Add Vehicle',
              style: tInterSemiBold.copyWith(color: tWhite)),
          style: ElevatedButton.styleFrom(
            backgroundColor: tOrange,
          ),
        ),
      ],
    );
  }
}
