import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';

class ReportIssuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Issue Page'),
      ),
      body: Center(
        child: Text('Report Issue Content'),
      ),
    );
  }
}
