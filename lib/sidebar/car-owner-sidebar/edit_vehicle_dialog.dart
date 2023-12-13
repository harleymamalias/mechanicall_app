import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../app_styles.dart';

class EditVehicleDialog extends StatefulWidget {
  final String documentId;
  final String initialMake;
  final String initialModel;
  final String initialYear;
  final String initialLicensePlate;

  const EditVehicleDialog({
    required this.documentId,
    required this.initialMake,
    required this.initialModel,
    required this.initialYear,
    required this.initialLicensePlate,
  });

  @override
  _EditVehicleDialogState createState() => _EditVehicleDialogState();
}

class _EditVehicleDialogState extends State<EditVehicleDialog> {
  late String make;
  late String model;
  late String year;
  late String licensePlate;

  @override
  void initState() {
    super.initState();
    make = widget.initialMake;
    model = widget.initialModel;
    year = widget.initialYear;
    licensePlate = widget.initialLicensePlate;
  }

  Future<void> _editVehicle() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Edit vehicle in Firestore under the 'vehicles' subcollection
        await FirebaseFirestore.instance
            .collection('car_owners')
            .doc(user.uid)
            .collection('vehicles')
            .doc(widget.documentId)
            .update({
          'make': make,
          'model': model,
          'year': year,
          'licensePlate': licensePlate,
        });

        Navigator.pop(context);
      }
    } catch (e) {
      print('Error editing vehicle: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Edit Vehicle',
        style: tInterBold,
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: TextEditingController(text: make),
              onChanged: (value) {
                make = value;
              },
              decoration: InputDecoration(
                labelText: 'Make',
                labelStyle: tInterSemiBold,
              ),
            ),
            TextField(
              controller: TextEditingController(text: model),
              onChanged: (value) {
                model = value;
              },
              decoration: InputDecoration(
                labelText: 'Model',
                labelStyle: tInterSemiBold,
              ),
            ),
            TextField(
              controller: TextEditingController(text: year),
              onChanged: (value) {
                year = value;
              },
              decoration: InputDecoration(
                labelText: 'Year',
                labelStyle: tInterSemiBold,
              ),
            ),
            TextField(
              controller: TextEditingController(text: licensePlate),
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
          onPressed: _editVehicle,
          child: Text('Save Changes',
              style: tInterSemiBold.copyWith(color: tWhite)),
          style: ElevatedButton.styleFrom(
            backgroundColor: tOrange,
          ),
        ),
      ],
    );
  }
}
