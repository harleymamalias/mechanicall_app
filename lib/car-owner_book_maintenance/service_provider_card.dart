import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ServiceProviderCard extends StatelessWidget {
  final String serviceProviderName;
  final String serviceProviderPhoto;
  final String serviceProviderSpecialties;
  final String email;
  final String phoneNumber;
  final String location;
  final List<String> certifications;

  const ServiceProviderCard({
    required this.serviceProviderName,
    required this.serviceProviderPhoto,
    required this.serviceProviderSpecialties,
    required this.email,
    required this.phoneNumber,
    required this.location,
    required this.certifications,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: SizeConfig.blockSizeVertical! * 10,
        decoration: BoxDecoration(
          color: tCharcoal,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.170),
              offset: const Offset(0.0, 3.0),
              blurRadius: 15.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: SizeConfig.blockSizeVertical! * 10,
                    height: SizeConfig.blockSizeHorizontal! * 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: Image.asset(serviceProviderPhoto).image,
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: tWhite.withOpacity(0.051),
                          offset: const Offset(0.0, 3.0),
                          blurRadius: 15.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Align(
                      alignment: Alignment(0.4, -2),
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal! * 3,
                        height: SizeConfig.blockSizeVertical! * 3,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            border: Border.all(width: 1, color: Colors.black)),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            width: SizeConfig.blockSizeHorizontal! * 1.5,
                            height: SizeConfig.blockSizeVertical! * 1.5,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: tOrange,
                    ),
                    ignoreGestures: true,
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: SizeConfig.blockSizeHorizontal! * 70,
                    child: Text(
                      "Name: $serviceProviderName",
                      style: tInterBold.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeVertical! * 1.5),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal! * 70,
                    child: Text(
                      "$phoneNumber / $email",
                      style: tInterMedium.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeVertical! * 1.3),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal! * 70,
                    child: Text(
                      "Specialties: $serviceProviderSpecialties",
                      style: tInterBold.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeVertical! * 1.3),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal! * 70,
                    child: Text(
                      "Location: "
                      "Talisay City, Cebu",
                      style: tInterBold.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeVertical! * 1.3),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
