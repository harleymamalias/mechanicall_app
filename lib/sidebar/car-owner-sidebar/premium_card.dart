import 'package:flutter/material.dart';
import '../../app_styles.dart';
import '../../size_config.dart';

class PremiumCard extends StatelessWidget {
  final String title;
  final String subtitle;

  PremiumCard({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
            child: Container(
              decoration: BoxDecoration(
                color: tOrange,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.workspace_premium_rounded,
                  size: SizeConfig.blockSizeHorizontal! * 6,
                  color: tWhite,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: tInterBold.copyWith(
                  color: tCharcoal,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3,
                ),
              ),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: tInterMedium.copyWith(
                  color: tCharcoal,
                  fontSize: SizeConfig.blockSizeHorizontal! * 2.8,
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.check_circle,
            size: SizeConfig.blockSizeHorizontal! * 8,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
