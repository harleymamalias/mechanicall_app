import 'package:flutter/material.dart';
import 'route-create.dart';
import '../roadside_assistance_id.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RequestForm extends StatefulWidget {
  @override
  _RequestFormState createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  Map<String, dynamic> requestData = {};
  Map<String, dynamic> carOwnerData = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRequestData();
  }

  Future<void> fetchRequestData() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('roadside_assistance')
          .doc(globalRoadsideAssistanceDocId)
          .get();

      if (snapshot.exists) {
      var data = snapshot.data() as Map<String, dynamic>;
      setState(() {
        requestData = data;
      });
      fetchCarOwnerData(data['userId']);
    }
    } catch (e) {
      print("Error fetching request data: $e");
    }
  }

  Future<void> fetchCarOwnerData(String? userId) async {
    if (userId == null) {
      print("User ID is null");
      return;
    }
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('car_owners')
          .doc(userId)
          .get();

      if (snapshot.exists) {
        setState(() {
          carOwnerData = snapshot.data() as Map<String, dynamic>;
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error fetching request data: $e");
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
            Text(
              requestData['description'] ??
                  'Unknown problem', // Replace with actual field name
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              requestData['location'] ??
                  'No description provided', // Replace with actual field name
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              '${carOwnerData['firstname'] ?? 'No'} ${carOwnerData['lastname'] ?? 'description provided'}',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              requestData['vehicleModel'] ??
                  'No description provided', // Replace with actual field name
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              requestData['timestamp'] != null
                ? formatDate(requestData['timestamp'].toDate())
                : 'Unknown time',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "ETA: 15 mins",
              style: TextStyle(color: Colors.white, fontSize: 20),
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
                    try {
                      await FirebaseFirestore.instance
                          .collection('roadside_assistance')
                          .doc(
                              globalRoadsideAssistanceDocId) 
                          .update({'status': 'confirmed'});

                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return RouteCreate();
                        },
                      );
                    } catch (e) {
                      print('Error updating status: $e');
                    }
                  },
                  child: Text('Accept'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String formatDate(DateTime dateTime) {
  return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
}

