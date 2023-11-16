import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';

class DataBackupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Backup Page',
          style: tInterRegular.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: SizeConfig.blockSizeHorizontal! * 5,
          ),
        ),
      ),
      body: Center(
        child: Text('Data Backup Content'),
      ),
    );
  }
}
