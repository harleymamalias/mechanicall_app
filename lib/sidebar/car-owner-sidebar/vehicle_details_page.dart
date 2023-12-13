import 'package:flutter/material.dart';
import '../../app_styles.dart';
import '../../size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'edit_vehicle_dialog.dart';

class VehicleDetails extends StatefulWidget {
  final String documentId;
  final String make;
  final String model;
  final String year;
  final String licensePlate;

  const VehicleDetails({
    required this.documentId,
    required this.make,
    required this.model,
    required this.year,
    required this.licensePlate,
    Key? key,
  }) : super(key: key);

  @override
  State<VehicleDetails> createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  late String documentId;
  late String make;
  late String model;
  late String year;
  late String licensePlate;

  @override
  void initState() {
    super.initState();
    documentId = widget.documentId;
    make = widget.make;
    model = widget.model;
    year = widget.year;
    licensePlate = widget.licensePlate;
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showConfirmationDialog(BuildContext context) async {
      return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirmation'),
            content: Text('Are you sure you want to delete this vehicle?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('Yes'),
              ),
            ],
          );
        },
      );
    }

    void deleteVehicle() async {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await FirebaseFirestore.instance
              .collection('car_owners')
              .doc(user.uid)
              .collection('vehicles')
              .doc(widget.documentId)
              .delete();
          Navigator.pop(context);
        }
      } catch (e) {
        print('Error deleting vehicle: $e');
      }
    }

    Future<void> updateVehicleDetails() async {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          // Reload the updated data from Firestore
          DocumentSnapshot updatedData = await FirebaseFirestore.instance
              .collection('car_owners')
              .doc(user.uid)
              .collection('vehicles')
              .doc(widget.documentId)
              .get();

          setState(() {
            make = updatedData['make'];
            model = updatedData['model'];
            year = updatedData['year'];
            licensePlate = updatedData['licensePlate'];
          });
        }
      } catch (e) {
        print('Error updating vehicle details: $e');
      }
    }

    return Container(
      decoration: const BoxDecoration(color: Colors.transparent),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [tCharcoal, Color(0xff125670)],
              ),
            ),
            child: Stack(
              children: [
                Container(
                  color: tCharcoal,
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: SizeConfig.blockSizeHorizontal! * 25,
                                    height: SizeConfig.blockSizeVertical! * 7.5,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.arrow_back_ios_new_rounded,
                                          size:
                                              SizeConfig.blockSizeHorizontal! *
                                                  7.5,
                                          color: tWhite,
                                          shadows: const [
                                            Shadow(
                                              offset: Offset(2.0, 2.0),
                                              blurRadius: 3.0,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      'Vehicle Details',
                                      style: tInterBold.copyWith(
                                        color: tWhite,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! * 5,
                                        shadows: [
                                          const Shadow(
                                            offset: Offset(2.0, 2.0),
                                            blurRadius: 3.0,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: SizeConfig.blockSizeHorizontal! * 25,
                                    height: SizeConfig.blockSizeVertical! * 7.5,
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: SizeConfig.blockSizeVertical! * 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [tCharcoal, Color(0xff125670)],
                      ),
                    ),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 10, 24, 8),
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: '${make} ',
                                  style: tInterMedium.copyWith(
                                    color: tWhite,
                                    fontSize:
                                        SizeConfig.blockSizeVertical! * 3.5,
                                  ),
                                ),
                                TextSpan(
                                  text: model,
                                  style: tInterBold.copyWith(
                                    color: tWhite,
                                    fontSize:
                                        SizeConfig.blockSizeVertical! * 3.5,
                                  ),
                                ),
                              ])),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: tOrange,
                            ),
                            height: SizeConfig.blockSizeVertical! * 12,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          year,
                                          style: tInterBold.copyWith(
                                            color: tWhite,
                                            fontSize:
                                                SizeConfig.blockSizeVertical! *
                                                    2.0,
                                          ),
                                        ),
                                        Text(
                                          'Year',
                                          style: tInterRegular.copyWith(
                                            color: tWhite,
                                            fontSize:
                                                SizeConfig.blockSizeVertical! *
                                                    2.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: SizeConfig.blockSizeVertical! * 5.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: tGrey2,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          licensePlate,
                                          style: tInterBold.copyWith(
                                            color: tWhite,
                                            fontSize:
                                                SizeConfig.blockSizeVertical! *
                                                    2.0,
                                          ),
                                        ),
                                        Text(
                                          'License Plate',
                                          style: tInterRegular.copyWith(
                                            color: tWhite,
                                            fontSize:
                                                SizeConfig.blockSizeVertical! *
                                                    2.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Tip: ',
                                  style: tInterBold.copyWith(
                                    color: tWhite,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3.5,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "Enhance your MechaniCALL experience by ensuring your vehicle details are accurate. Easily edit the vehicle image and license plate in the 'Vehicle Details' section. Rest assured, MechaniCALL keeps your license plate information secure, providing you with full control and peace of mind for all your added vehicles.",
                                  style: tInterRegular.copyWith(
                                    color: tWhite,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: tAmaranthPurple,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () async {
                                  bool confirmDelete =
                                      await showConfirmationDialog(context);
                                  if (confirmDelete) {
                                    deleteVehicle();
                                  }
                                },
                                child: Icon(
                                  Icons.delete_rounded,
                                  size: SizeConfig.blockSizeHorizontal! * 5,
                                  color: tWhite,
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: tEcru,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () async {
                                    // Show the EditVehicleDialog and pass the required data
                                    await showDialog(
                                      context: context,
                                      builder: (context) => EditVehicleDialog(
                                        documentId: widget
                                            .documentId, // Pass the documentId
                                        initialMake: make,
                                        initialModel: model,
                                        initialYear: year,
                                        initialLicensePlate: licensePlate,
                                      ),
                                    );

                                    await updateVehicleDetails();
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        // 'Edit License Plate / Photo',
                                        'Edit',
                                        style: tInterBold.copyWith(
                                            color: tWhite,
                                            fontSize:
                                                SizeConfig.blockSizeVertical! *
                                                    1.5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
