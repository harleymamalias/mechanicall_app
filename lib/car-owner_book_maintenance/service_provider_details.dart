import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ServiceProviderDetailsCard extends StatelessWidget {
  final String serviceProviderName;
  final String serviceProviderPhoto;
  final String serviceProviderSpecialties;
  final String email;
  final String phoneNumber;
  final String location;
  final List<String> certifications;
  final double rating;
  final VoidCallback? onButtonPressed;

  const ServiceProviderDetailsCard(
      {required this.serviceProviderName,
      required this.serviceProviderPhoto,
      required this.serviceProviderSpecialties,
      required this.email,
      required this.phoneNumber,
      required this.location,
      required this.certifications,
      required this.rating,
      super.key,
      this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff125670), tCharcoal],
          ),
          borderRadius: BorderRadius.circular(24)),
      width: SizeConfig.blockSizeHorizontal! * 100,
      height: SizeConfig.blockSizeVertical! * 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: SizeConfig.blockSizeVertical! * 20,
            height: SizeConfig.blockSizeHorizontal! * 20,
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
                width: SizeConfig.blockSizeHorizontal! * 6,
                height: SizeConfig.blockSizeVertical! * 6,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                    border: Border.all(width: 1, color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal! * 3,
                    height: SizeConfig.blockSizeVertical! * 3,
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
            initialRating: rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: SizeConfig.blockSizeHorizontal! * 7,
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
          SizedBox(
            height: 5,
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal! * 70,
            child: Text(
              "Name: $serviceProviderName",
              style: tInterBold.copyWith(
                  color: tWhite, fontSize: SizeConfig.blockSizeVertical! * 2.5),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal! * 70,
            child: Text(
              "Number and Email:",
              style: tInterSemiBold.copyWith(
                  color: tWhite, fontSize: SizeConfig.blockSizeVertical! * 2),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal! * 70,
            child: Text(
              "$phoneNumber / $email",
              style: tInterMedium.copyWith(
                  color: tWhite, fontSize: SizeConfig.blockSizeVertical! * 1.5),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal! * 70,
            child: Text(
              "Specialties:",
              style: tInterSemiBold.copyWith(
                  color: tWhite, fontSize: SizeConfig.blockSizeVertical! * 2),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal! * 70,
            child: Text(
              "$serviceProviderSpecialties",
              style: tInterMedium.copyWith(
                  color: tWhite, fontSize: SizeConfig.blockSizeVertical! * 1.5),
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal! * 70,
            child: Text(
              "Location:",
              style: tInterSemiBold.copyWith(
                  color: tWhite, fontSize: SizeConfig.blockSizeVertical! * 2),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal! * 70,
            child: Text(
              "$location",
              style: tInterMedium.copyWith(
                  color: tWhite, fontSize: SizeConfig.blockSizeVertical! * 1.5),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: SizeConfig.blockSizeHorizontal! * 70,
            child: Text(
              "Certifications:",
              style: tInterSemiBold.copyWith(
                  color: tWhite, fontSize: SizeConfig.blockSizeVertical! * 2),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: SizeConfig.blockSizeHorizontal! * 40,
            child: ListView.builder(
              itemCount: certifications.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: SizeConfig.blockSizeVertical! * 13,
                      width: SizeConfig.blockSizeHorizontal! * 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: tAmaranthPurple,
                          image: DecorationImage(
                              image: AssetImage(
                                certifications[index],
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 12,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: tOrange,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Text(
              'Go Back',
              style: tInterBold.copyWith(color: tWhite),
            ),
          ),
        ],
      ),
    );
  }
}
