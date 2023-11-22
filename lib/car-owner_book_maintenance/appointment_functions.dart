import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'car-owner-event.dart';
import '../size_config.dart';
import '../app_styles.dart';

String getBookingStatusString(BookingStatus status) {
  switch (status) {
    case BookingStatus.pending:
      return 'Pending';
    case BookingStatus.confirmed:
      return 'Confirmed';
    case BookingStatus.completed:
      return 'Completed';
    case BookingStatus.canceled:
      return 'Canceled';
    default:
      return 'Unknown';
  }
}

class EventDetailsWidget extends StatelessWidget {
  final String eventType;
  final String serviceProviderName;
  final String serviceProviderPhoto;
  final String email;
  final String phoneNumber;
  final String location;
  final double rating;
  final String bookingDescription;
  final TimeOfDay bookingTime;
  final BookingStatus bookingStatus;

  const EventDetailsWidget({
    required this.eventType,
    required this.serviceProviderName,
    required this.serviceProviderPhoto,
    required this.email,
    required this.phoneNumber,
    required this.location,
    required this.rating,
    required this.bookingDescription,
    required this.bookingTime,
    required this.bookingStatus,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical! * 40,
      child: ListView(
        children: [
          Container(
            width: SizeConfig.blockSizeVertical! * 20,
            height: SizeConfig.blockSizeHorizontal! * 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: Image.asset(serviceProviderPhoto).image,
                fit: BoxFit.fitHeight,
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
              alignment: Alignment(0.23, -1.3),
              child: Container(
                width: SizeConfig.blockSizeHorizontal! * 4,
                height: SizeConfig.blockSizeVertical! * 4,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                    border: Border.all(width: 0.8, color: Colors.black)),
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
          Row(
            children: [
              Text(
                'Rating: ',
                style: tInterBold.copyWith(
                    color: tWhite,
                    fontSize: SizeConfig.blockSizeHorizontal! * 3),
              ),
              RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: SizeConfig.blockSizeHorizontal! * 5,
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Service Provider Name: ',
                    style: tInterBold.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                  TextSpan(
                    text: '${serviceProviderName}',
                    style: tInterRegular.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Phone Number: ',
                    style: tInterBold.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                  TextSpan(
                    text: '${phoneNumber}',
                    style: tInterRegular.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Email: ',
                    style: tInterBold.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                  TextSpan(
                    text: '${email}',
                    style: tInterRegular.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Location: ',
                    style: tInterBold.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                  TextSpan(
                    text: '${location}',
                    style: tInterRegular.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: SizeConfig.blockSizeVertical! * 0.5,
            width: SizeConfig.blockSizeHorizontal! * 0.5,
            color: tButterscotch,
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Event Type: ',
                    style: tInterBold.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                  TextSpan(
                    text: '${eventType}',
                    style: tInterRegular.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Appointment Description: ',
                    style: tInterBold.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                  TextSpan(
                    text: '${bookingDescription}',
                    style: tInterRegular.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Booking Time: ',
                    style: tInterBold.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                  TextSpan(
                    text: '${bookingTime.format(context)}',
                    style: tInterRegular.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Booking Status: ',
                    style: tInterBold.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                  TextSpan(
                    text: '${getBookingStatusString(bookingStatus)}',
                    style: tInterRegular.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
