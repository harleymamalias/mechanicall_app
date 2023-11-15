import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';

class ManageProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Profile Page'),
      ),
      body: Center(
        child: Text('Manage Profile Content'),
      ),
    );
  }
}
