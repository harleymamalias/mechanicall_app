import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'route-creation.dart';
import 'package:mechanicall_app/roadside_assistance_id.dart';

class Wait extends StatefulWidget {
  final String docId;

  const Wait({Key? key, required this.docId}) : super(key: key);

  @override
  _WaitState createState() => _WaitState();
}

class _WaitState extends State<Wait> {
  late StreamSubscription<DocumentSnapshot> _statusSubscription;
  late String status;

  @override
  void initState() {
    super.initState();
    // Subscribe to the changes in the roadside_assistance document
    _statusSubscription = FirebaseFirestore.instance
        .collection('roadside_assistance')
        .doc(widget.docId)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        setState(() {
          status = snapshot['status'];
        });
        if (status == 'confirmed') {
          // Status changed to confirmed, show the RouteCreation dialog
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return RouteCreation();
            },
          );
        }
      }
    });
  }

  @override
  void dispose() {
    // Cancel the subscription to avoid memory leaks
    _statusSubscription.cancel();
    super.dispose();
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
              'Request Sent',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Waiting for confirmation...",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    WriteBatch batch = FirebaseFirestore.instance.batch();

                    DocumentReference requestRef = FirebaseFirestore.instance
                        .collection('roadside_assistance')
                        .doc(widget.docId);

                    batch.delete(requestRef);

                    if (globalCarOwnerId != null) {
                      DocumentReference carOwnerRef = FirebaseFirestore.instance
                          .collection(
                              'car_owners') // Adjust the collection name as necessary
                          .doc(globalCarOwnerId);
                      batch.update(carOwnerRef,
                          {'requests': FieldValue.delete()});
                    }

                    if (globalServiceProviderId != null) {
                      DocumentReference serviceProviderRef = FirebaseFirestore
                          .instance
                          .collection(
                              'service_providers') // Adjust the collection name as necessary
                          .doc(globalServiceProviderId);
                      batch.update(serviceProviderRef,
                          {'requests': FieldValue.delete()});
                    }

                    await batch.commit();

                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection('roadside_assistance')
                        .doc(widget.docId)
                        .update({'status': 'confirmed'});
                  },
                  child: Text('Done'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
