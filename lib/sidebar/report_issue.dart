import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';

class ReportIssuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: SizeConfig.blockSizeHorizontal! * 25,
                height: SizeConfig.blockSizeVertical! * 7.5,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: SizeConfig.blockSizeHorizontal! * 7.5,
                      color: tCharcoal,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Report Issues',
                  style: tInterRegular.copyWith(
                    fontWeight: FontWeight.w600,
                    color: tCharcoal,
                    fontSize: SizeConfig.blockSizeHorizontal! * 5,
                  ),
                ),
              ),
              Container(
                width: SizeConfig.blockSizeHorizontal! * 25,
                height: SizeConfig.blockSizeVertical! * 7.5,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
