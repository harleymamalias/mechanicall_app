import 'dart:async';

import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'service_provider_details.dart';

class ServiceProviderCard extends StatefulWidget {
  final String serviceProviderName;
  final String serviceProviderPhoto;
  final String serviceProviderSpecialties;
  final String email;
  final String phoneNumber;
  final String location;
  final List<String> certifications;
  final double rating;
  final Function(String, String, String, String, String, double)
      onServiceProviderSelected;
  final bool isSelected;

  const ServiceProviderCard({
    required this.serviceProviderName,
    required this.serviceProviderPhoto,
    required this.serviceProviderSpecialties,
    required this.email,
    required this.phoneNumber,
    required this.location,
    required this.certifications,
    required this.rating,
    super.key,
    required this.onServiceProviderSelected,
    required this.isSelected,
  });
  @override
  _ServiceProviderCardState createState() => _ServiceProviderCardState();
}

class _ServiceProviderCardState extends State<ServiceProviderCard> {
  bool isSelected = false;

  void _updateSelectedServiceProvider() {
    widget.onServiceProviderSelected(
      widget.serviceProviderName,
      widget.serviceProviderPhoto,
      widget.email,
      widget.phoneNumber,
      widget.location,
      widget.rating,
    );

    setState(() {
      isSelected = true;
    });

    // timer to reset isSelected after 2 seconds
    Timer(Duration(seconds: 2), () {
      setState(() {
        isSelected = false;
      });
    });
  }

  void _showDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: IntrinsicWidth(
            child: ServiceProviderDetailsCard(
              serviceProviderName: widget.serviceProviderName,
              serviceProviderPhoto: widget.serviceProviderPhoto,
              serviceProviderSpecialties: widget.serviceProviderSpecialties,
              email: widget.email,
              phoneNumber: widget.phoneNumber,
              location: widget.location,
              certifications: widget.certifications,
              rating: widget.rating,
              onButtonPressed: () {},
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _updateSelectedServiceProvider();
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          height: SizeConfig.blockSizeVertical! * 12,
          decoration: BoxDecoration(
            color: isSelected ? tAmaranthPurple : tCharcoal,
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
                          image: Image.asset(widget.serviceProviderPhoto).image,
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
                        alignment: Alignment(0.4, -1.2),
                        child: Container(
                          width: SizeConfig.blockSizeHorizontal! * 2,
                          height: SizeConfig.blockSizeVertical! * 2,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                              border:
                                  Border.all(width: 0.8, color: Colors.black)),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal! * 1,
                              height: SizeConfig.blockSizeVertical! * 1,
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
                      initialRating: widget.rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: SizeConfig.blockSizeHorizontal! * 3,
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
                      width: SizeConfig.blockSizeHorizontal! * 35,
                      child: Text(
                        "Name: ${widget.serviceProviderName}",
                        style: tInterBold.copyWith(
                            color: tWhite,
                            fontSize: SizeConfig.blockSizeVertical! * 1.3),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      width: SizeConfig.blockSizeHorizontal! * 35,
                      child: Text(
                        "${widget.phoneNumber} / ${widget.email}",
                        style: tInterMedium.copyWith(
                            color: tWhite,
                            fontSize: SizeConfig.blockSizeVertical! * 1),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      width: SizeConfig.blockSizeHorizontal! * 35,
                      child: Text(
                        "Specialties: ${widget.serviceProviderSpecialties}",
                        style: tInterBold.copyWith(
                            color: tWhite,
                            fontSize: SizeConfig.blockSizeVertical! * 1),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      width: SizeConfig.blockSizeHorizontal! * 35,
                      child: Text(
                        "Location: ${widget.location}",
                        style: tInterBold.copyWith(
                            color: tWhite,
                            fontSize: SizeConfig.blockSizeVertical! * 1),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      width: SizeConfig.blockSizeHorizontal! * 35,
                      height: SizeConfig.blockSizeVertical! * 2.5,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: tOrange,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: () {
                            _showDetailsDialog(context);
                          },
                          child: Text(
                            "View Details",
                            style: tInterBold.copyWith(
                                color: tWhite,
                                fontSize: SizeConfig.blockSizeVertical! * 1),
                          )),
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
