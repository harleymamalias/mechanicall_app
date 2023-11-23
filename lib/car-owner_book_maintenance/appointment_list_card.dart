import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../size_config.dart';
import '../app_styles.dart';
import 'appointment_functions.dart';
import 'car-owner-event.dart';

class EventListItem extends StatelessWidget {
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

  const EventListItem({
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
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            tCharcoal,
            Color(0xff125670),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.170),
            offset: const Offset(0.0, 3.0),
            blurRadius: 15.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: ListTile(
        onTap: () => print(""),
        title: Row(
          children: [
            Column(
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
                    alignment: Alignment(0.4, -1.2),
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal! * 2,
                      height: SizeConfig.blockSizeVertical! * 2,
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
                RatingBar.builder(
                  initialRating: rating,
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
                Text(
                  '${serviceProviderName}',
                  style: tInterBold.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
                ),
                Text(
                  '${phoneNumber}',
                  style: tInterMedium.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 2),
                ),
                Text(
                  '${email}',
                  style: tInterMedium.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 2),
                ),
              ],
            ),
            SizedBox(
              width: 4,
            ),
            Container(
              width: 2,
              child: SizedBox(
                height: SizeConfig.blockSizeVertical! * 12,
              ),
              decoration: BoxDecoration(color: tButterscotch),
            ),
            SizedBox(
              width: 4,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${eventType}'.toUpperCase(),
                  style: tInterBold.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 4),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Container(
                  width: SizeConfig.blockSizeHorizontal! * 40,
                  child: Text(
                    '${bookingDescription}',
                    style: tInterBold.copyWith(
                        color: tWhite,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Text(
                  'Time: ${bookingTime.format(context)}',
                  style: tInterMedium.copyWith(
                    color: tWhite,
                    fontSize: SizeConfig.blockSizeHorizontal! * 3,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  'Status: ${getBookingStatusString(bookingStatus)}',
                  style: tInterMedium.copyWith(
                      color: tWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Container(
                  width: SizeConfig.blockSizeHorizontal! * 40,
                  child: Text(
                    'Location: ${location}',
                    style: tInterMedium.copyWith(
                        color: tWhite,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
