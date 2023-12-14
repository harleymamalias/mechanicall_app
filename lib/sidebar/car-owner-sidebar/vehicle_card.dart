import 'package:flutter/material.dart';
import '../../app_styles.dart';
import '../../size_config.dart';
import 'vehicle_details_page.dart';

class VehicleCard extends StatelessWidget {
  final String documentId;
  final String make;
  final String model;
  final String year;
  final String licensePlate;
  final String? imagePath;

  const VehicleCard({
    Key? key,
    required this.documentId,
    required this.make,
    required this.model,
    required this.year,
    required this.licensePlate,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,  
          MaterialPageRoute(
            builder: (context) => KeyedSubtree(
              child: VehicleDetails(
                documentId: documentId,
                make: make,
                model: model,
                year: year,
                licensePlate: licensePlate,
                imagePath: imagePath ?? "",
              ),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
        child: Container(
          height: SizeConfig.blockSizeVertical! * 18,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [tCharcoal, Color(0xff125670)],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                width: SizeConfig.blockSizeHorizontal! * 40,
                decoration: BoxDecoration(
                  color: tOrange,
                  borderRadius: BorderRadius.circular(16),
                  image: imagePath != null
                      ? DecorationImage(
                          image: NetworkImage(imagePath!),
                          fit: BoxFit.contain,
                        )
                      : null, // Don't provide DecorationImage if imagePath is null
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                      child: SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 37,
                        child: RichText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: '$make ',
                            style: tInterRegular.copyWith(
                              color: tWhite,
                              fontSize: SizeConfig.blockSizeHorizontal! * 4,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: model,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                      child: SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 37,
                        child: RichText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: 'Year:  ',
                            style: tInterRegular.copyWith(
                              color: tWhite,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
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
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                      child: Text(
                        'License Plate:',
                        style: tInterRegular.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                      child: Text(
                        licensePlate,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: tInterRegular.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
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
