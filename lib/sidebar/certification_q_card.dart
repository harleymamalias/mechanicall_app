import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';

class CertificationCard extends StatelessWidget {
  final String imagePath;
  final String year;

  const CertificationCard({
    required this.imagePath,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
        child: Container(
          height: SizeConfig.blockSizeVertical! * 18,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [tCharcoal, Color(0xff125670)],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                width: SizeConfig.blockSizeHorizontal! * 55,
                decoration: BoxDecoration(
                  color: tOrange,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal! * 20,
                        child: RichText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: 'Year ',
                            style: tInterRegular.copyWith(
                              color: tWhite,
                              fontSize: SizeConfig.blockSizeHorizontal! * 4,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: year,
                                style: tInterBold.copyWith(
                                  color: tWhite,
                                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
