import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';

class OwnedVehiclesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Owned Vehicles Page'),
      ),
      body: Center(
        child: Text('Owned Vehicles Content'),
      ),
    );
  }
}
