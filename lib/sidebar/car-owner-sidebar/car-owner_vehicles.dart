import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'add_vehicle_dialog.dart';
import '../../app_styles.dart';
import '../../size_config.dart';
import 'vehicle_card.dart';

class OwnedVehiclesPage extends StatelessWidget {
  final Map<String, dynamic>? userDetails;

  OwnedVehiclesPage({Key? key, this.userDetails}) : super(key: key);

  Stream<List<Map<String, dynamic>>> _streamOwnedVehicles() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return FirebaseFirestore.instance
          .collection('car_owners')
          .doc(user.uid)
          .collection('vehicles')
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          data['documentId'] = doc.id;
          return data;
        }).toList();
      });
    } else {
      return Stream.empty();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          size: SizeConfig.blockSizeHorizontal! * 7.5,
                          color: tCharcoal,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Owned Vehicles',
                      style: tInterRegular.copyWith(
                        fontWeight: FontWeight.w600,
                        color: tCharcoal,
                        fontSize: SizeConfig.blockSizeHorizontal! * 5,
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal! * 25,
                    height: SizeConfig.blockSizeVertical! * 7.5,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: StreamBuilder<List<Map<String, dynamic>>>(
                  stream: _streamOwnedVehicles(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No owned vehicles found.'),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var vehicle = snapshot.data![index];
                          return VehicleCard(
                            documentId: vehicle['documentId'],
                            make: vehicle['make'],
                            model: vehicle['model'],
                            year: vehicle['year'],
                            licensePlate: vehicle['licensePlate'],
                            // imagePath: '',
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: tCharcoal,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddVehicleDialog();
                },
              );
            },
            child: const Icon(
              Icons.add,
              color: tWhite,
            ),
          ),
        ),
      ),
    );
  }
}
