import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Map<String, dynamic>?> getCurrentUserDetails() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        // Retrieve user details from Firestore based on the user's UID
        DocumentSnapshot carOwnerSnapshot = await FirebaseFirestore.instance
            .collection('car_owners')
            .doc(user.uid)
            .get();

        DocumentSnapshot serviceProviderSnapshot = await FirebaseFirestore
            .instance
            .collection('service_providers')
            .doc(user.uid)
            .get();

        if (carOwnerSnapshot.exists) {
          return carOwnerSnapshot.data() as Map<String, dynamic>;
        } else if (serviceProviderSnapshot.exists) {
          return serviceProviderSnapshot.data() as Map<String, dynamic>;
        }
      }

      return null;
    } catch (e) {
      print('Error retrieving user details: $e');
      return null;
    }
  }

  Future<void> refreshUserDetails(BuildContext context) async {
    try {
      Map<String, dynamic>? userDetails = await getCurrentUserDetails();
      if (userDetails != null) {
        UserProvider userProvider =
            Provider.of<UserProvider>(context, listen: false);
        userProvider.setUserDetails(userDetails);
      }
    } catch (e) {
      print('Error refreshing user details: $e');
      // Handle error as needed
    }
  }

  Future<void> updateCurrentUserDetails({
    required String username,
    required String firstname,
    required String lastname,
    required String email,
    required String phoneNumber,
  }) async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        // Update user details in Firestore based on the user's UID
        await FirebaseFirestore.instance
            .collection('car_owners')
            .doc(user.uid)
            .update({
          'username': username,
          'firstname': firstname,
          'lastname': lastname,
          'email': email,
          'phoneNumber': phoneNumber,
        });

        await FirebaseFirestore.instance
            .collection('service_providers')
            .doc(user.uid)
            .update({
          'username': username,
          'firstname': firstname,
          'lastname': lastname,
          'email': email,
          'phoneNumber': phoneNumber,
        });
      }
    } catch (e) {
      print('Error updating user details: $e');
      // Handle error, show a message, or throw the error depending on your requirements
    }
  }
}

class UserProvider extends ChangeNotifier {
  Map<String, dynamic>? _userDetails;

  Map<String, dynamic>? get userDetails => _userDetails;

  void setUserDetails(Map<String, dynamic>? userDetails) {
    _userDetails = userDetails;
    User? user = FirebaseAuth.instance.currentUser;
    print("Setting user details: $userDetails");
    if (user != null) {
      print("User UID: ${user.uid}");
    }
    notifyListeners();
  }
}
