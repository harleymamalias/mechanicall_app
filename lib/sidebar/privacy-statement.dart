import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';

class PrivacyStatementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Statement Page'),
      ),
      body: Center(
        child: Text('Privacy Statement Content'),
      ),
    );
  }
}
