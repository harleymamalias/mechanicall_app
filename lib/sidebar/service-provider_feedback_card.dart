import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../app_styles.dart';
import '../size_config.dart';

class ServiceProviderFeedbackCard extends StatelessWidget {
  final String eventType;
  final String date;
  final String serviceDetails;
  final String serviceProviderName;
  final String vehicleImage;
  final String vehicleMake;
  final String vehicleModel;
  final double rating;
  final String feedback;

  ServiceProviderFeedbackCard({
    required this.eventType,
    required this.date,
    required this.serviceDetails,
    required this.serviceProviderName,
    required this.vehicleImage,
    required this.vehicleMake,
    required this.vehicleModel,
    required this.rating,
    required this.feedback,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
      child: Container(
        height: SizeConfig.blockSizeVertical! * 30,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [tCharcoal, Color(0xff125670)],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: GestureDetector(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => transactionDetails(
            //       eventType: eventType,
            //       date: date,
            //       serviceDetails: serviceDetails,
            //       serviceProviderName: serviceProviderName,
            //       vehicleImage: vehicleImage,
            //       vehicleMake: vehicleMake,
            //       vehicleModel: vehicleModel,
            //     ),
            //   ),
            // );
          },
          child: Column(
            children: [
              Container(
                height: SizeConfig.blockSizeVertical! * 12,
                child: Row(
                  children: [
                    Container(
                      width: SizeConfig.blockSizeHorizontal! * 25,
                      height: SizeConfig.blockSizeVertical! * 25,
                      decoration: BoxDecoration(
                        color: tOrange,
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(vehicleImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal! * 50,
                              child: RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  text: 'Event Type: ',
                                  style: tInterRegular.copyWith(
                                    color: tWhite,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3.5,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: eventType,
                                      style: tInterBold.copyWith(
                                        color: tWhite,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal! * 50,
                              child: RichText(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  text: 'Date: ',
                                  style: tInterRegular.copyWith(
                                    color: tWhite,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: date,
                                      style: tInterBold.copyWith(
                                        color: tWhite,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! * 3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal! * 50,
                              child: RichText(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  text: 'Details: ',
                                  style: tInterRegular.copyWith(
                                    color: tWhite,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: serviceDetails,
                                      style: tInterBold.copyWith(
                                        color: tWhite,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! * 3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal! * 50,
                              child: RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  text: '$vehicleMake: ',
                                  style: tInterRegular.copyWith(
                                    color: tWhite,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: vehicleModel,
                                      style: tInterBold.copyWith(
                                        color: tWhite,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! * 3,
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
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: tOrange,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      RatingBar.builder(
                        initialRating: rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: SizeConfig.blockSizeHorizontal! * 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        ignoreGestures: true,
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Feedback Comment",
                        style: tInterBold.copyWith(
                            color: tWhite,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Text(
                          feedback,
                          style: tInterMedium.copyWith(
                              color: tWhite,
                              fontSize: SizeConfig.blockSizeHorizontal! * 2.5),
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
