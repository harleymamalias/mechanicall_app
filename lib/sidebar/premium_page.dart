import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';

class PremiumServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Premium Services Page'),
      ),
      body: Center(
        child: Text('Premium Services Content'),
      ),
    );
  }
}
