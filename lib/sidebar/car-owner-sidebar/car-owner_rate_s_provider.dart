import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../app_styles.dart';
import '../../size_config.dart';

class RatingPage extends StatefulWidget {
  final String eventType;
  final String serviceProviderName;
  final String vehicleImage;
  const RatingPage({
    Key? key,
    required this.eventType,
    required this.serviceProviderName,
    required this.vehicleImage,
  }) : super(key: key);

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  int selectedRating = 3;
  String feedbackMessage = "Average";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: SizeConfig.blockSizeHorizontal! * 20,
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
                        'Rate Service Provider',
                        style: tInterRegular.copyWith(
                          fontWeight: FontWeight.w600,
                          color: tCharcoal,
                          fontSize: SizeConfig.blockSizeHorizontal! * 5,
                        ),
                      ),
                    ),
                    Container(
                      width: SizeConfig.blockSizeHorizontal! * 20,
                      height: SizeConfig.blockSizeVertical! * 7.5,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal! * 20,
                        height: SizeConfig.blockSizeHorizontal! * 15,
                        decoration: BoxDecoration(
                            color: tCharcoal,
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage(
                                widget.vehicleImage,
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.eventType,
                            style: tInterBold.copyWith(
                              fontSize: SizeConfig.blockSizeVertical! * 2.5,
                            ),
                          ),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: "Service Provider: ",
                                  style: tInterMedium.copyWith(),
                                ),
                                TextSpan(
                                  text: widget.serviceProviderName,
                                  style: tInterSemiBold.copyWith(),
                                ),
                              ])),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 0.7,
                  color: Color.fromARGB(255, 190, 189, 189),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              "Service Quality",
                              style: tInterSemiBold.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 3,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: SizeConfig.blockSizeVertical! * 2.5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                setState(() {
                                  selectedRating = rating.toInt();
                                  switch (selectedRating) {
                                    case 5:
                                      feedbackMessage = "Amazing";
                                      break;
                                    case 4:
                                      feedbackMessage = "Good";
                                      break;
                                    case 3:
                                      feedbackMessage = "Average";
                                      break;
                                    case 2:
                                      feedbackMessage = "Poor";
                                      break;
                                    case 1:
                                      feedbackMessage = "Terrible";
                                      break;
                                    default:
                                      feedbackMessage = "";
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                feedbackMessage,
                                style: tInterMedium.copyWith(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3,
                                    color: tOrange),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: SizeConfig.blockSizeVertical! * 25,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 2),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: tCharcoal,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: null,
                            maxLines: null,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Add Feedback',
                              hintStyle: tInterBold.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 4,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "CANCEL",
                                style: tInterBold,
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          "Feedback Sent",
                                          style: tInterSemiBold,
                                        ),
                                        content: Text(
                                          "Thank you for your feedback! Your input on the service provider helps us improve MechaniCALL. Drive safely!",
                                          style: tInterMedium,
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              "OK",
                                              style: tInterBold.copyWith(
                                                  color: tOrange),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: tOrange,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                                child: Text(
                                  "SUBMIT",
                                  style: tInterBold.copyWith(color: tWhite),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
