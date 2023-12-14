import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
  File? _image;

  bool isLoading = false;

  Future<void> _addVehicle() async {
    try {
      setState(() {
        isLoading = true;
      });

      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        if (make.isEmpty ||
            model.isEmpty ||
            year.isEmpty ||
            licensePlate.isEmpty ||
            _image == null) {
          print('Please fill in all fields and select an image');
          return;
        }

        String imagePath = await uploadImageToFirestoreStorage(_image!);

        await FirebaseFirestore.instance
            .collection('car_owners')
            .doc(user.uid)
            .collection('vehicles')
            .add({
          'make': make,
          'model': model,
          'year': year,
          'licensePlate': licensePlate,
          'imagePath': imagePath,
        });

        print('Chosen image file name: ${_image!.path}');

        Navigator.pop(context);
      }
    } catch (e) {
      print('Error adding vehicle: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<String> uploadImageToFirestoreStorage(File imageFile) async {
    try {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('vehicle_images/${DateTime.now().millisecondsSinceEpoch}.png');
      UploadTask uploadTask = storageReference.putFile(imageFile);
      TaskSnapshot storageTaskSnapshot =
          await uploadTask.whenComplete(() => null);
      String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image to Firestore Storage: $e');
      throw Exception('Image upload failed');
    }
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Add Vehicle',
        style: tInterBold,
      ),
      content: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Picker Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _getImage,
                      icon: const Icon(Icons.image, color: Colors.white),
                      label: const Text('Select Image',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ],
                ),

                // Display selected image
                _image != null ? Image.file(_image!) : Container(),
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
          if (isLoading)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 10),
                      Text(
                        'Uploading your vehicle information...',
                        style: TextStyle(color: tCharcoal),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel', style: tInterSemiBold),
        ),
        ElevatedButton(
          onPressed: isLoading ? null : _addVehicle,
          style: ElevatedButton.styleFrom(
            backgroundColor: tOrange,
          ),
          child: Text('Add Vehicle',
              style: tInterSemiBold.copyWith(color: tWhite)),
        ),
      ],
    );
  }
}
