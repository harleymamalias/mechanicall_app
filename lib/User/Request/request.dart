import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'wait.dart';
import '../../roadside_assistance_id.dart';


class RequestMechanic extends StatefulWidget {
  @override
  _RequestFormState createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestMechanic> {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? selectedServiceProvider;
  String? selectedVehicleModel;

  Future<List<String>> getServiceProviders() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('service_providers').get();
    List<String> providers = [];
    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
      String firstname = doc['firstname'];
      String lastname = doc['lastname'];
      providers.add('$firstname $lastname');
    }
    return providers;
  }

  Future<List<String>> getUserVehicleModels() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('car_owners')
          .doc(user.uid)
          .collection('vehicles')
          .get();
      List<String> models = [];
      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
        String model = doc['model'];
        models.add(model);
      }
      return models;
    } else {
      return [];
    }
  }

  Future<String> storeRoadsideAssistanceRequest() async {
  try {
    User? user = _auth.currentUser;
    if (user == null || user.uid.isEmpty) {
      print('User is not logged in or UID is empty');
      return '';
    }

    // Extracting first name and last name from the selected service provider
    List<String> names = selectedServiceProvider?.split(' ') ?? [];
    String firstname = names.isNotEmpty ? names[0] : '';
    String lastname = names.length > 1 ? names[1] : '';

    // Fetch the selected service provider document to get its ID
    QuerySnapshot<Map<String, dynamic>> serviceProviderSnapshot =
        await _firestore
            .collection('service_providers')
            .where('firstname', isEqualTo: firstname)
            .where('lastname', isEqualTo: lastname)
            .get();

    String serviceProviderId = serviceProviderSnapshot.docs.isNotEmpty
        ? serviceProviderSnapshot.docs.first.id
        : '';

    // Add the roadside assistance details to Firestore
    DocumentReference docRef = await _firestore.collection('roadside_assistance').add({
      'userId': user.uid,
      'location': locationController.text,
      'description': descriptionController.text,
      'serviceProviderId': serviceProviderId, // Store the service provider ID
      'vehicleModel': selectedVehicleModel,
      'status': 'pending',
      'timestamp': FieldValue.serverTimestamp(),
    });

    String docId = docRef.id;
    await _firestore.collection('car_owners').doc(user.uid).update({
      'requests': FieldValue.arrayUnion([docId]),
    });

    await _firestore.collection('service_providers').doc(serviceProviderId).update({
      'requests': FieldValue.arrayUnion([docId]),
    });

    globalRoadsideAssistanceDocId = docId;
    globalCarOwnerId = user.uid;
    globalServiceProviderId = serviceProviderId;
    return docId;
  } catch (e) {
    print('Error storing roadside assistance request: $e');
    return '';
  }
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
              'Request Help',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Current Location',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            FutureBuilder(
              future: getServiceProviders(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error loading service providers');
                } else if (snapshot.data == null || (snapshot.data as List<String>).isEmpty) {
                  return Text('No data available');
                } else {
                  List<String> providers = snapshot.data as List<String>;
                  print('Service Providers: $providers');
                  return DropdownButtonFormField(
                    itemHeight: 50,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    value: selectedServiceProvider,
                    onChanged: (value) {
                      setState(() {
                        selectedServiceProvider = value.toString();
                      });
                    },
                    items: providers
                        .map((provider) => DropdownMenuItem(
                              value: provider,
                              child: Text(provider),
                            ))
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'Select Service Provider',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  );
                }
              },
            ),

            FutureBuilder(
              future: getUserVehicleModels(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error loading vehicle models');
                } else if (snapshot.data == null || (snapshot.data as List<String>).isEmpty) {
                  return Text('No data available');
                } else {
                  List<String> models = snapshot.data as List<String>;
                  print('Cars: $models');
                  return DropdownButtonFormField(
                    itemHeight: 50,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    value: selectedVehicleModel,
                    onChanged: (value) {
                      setState(() {
                        selectedVehicleModel = value.toString();
                      });
                    },
                    items: models
                        .map((model) => DropdownMenuItem(
                              value: model,
                              child: Text(model),
                            ))
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'Select Vehicle Model',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    String docId = await storeRoadsideAssistanceRequest();
                    if (docId.isNotEmpty) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return Wait(docId: docId); // Pass the document ID to the Wait widget
                        },
                      );
                    }
                  },
                  child: Text('Request'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
