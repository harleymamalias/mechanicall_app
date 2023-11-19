import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';

class VehicleDetails extends StatelessWidget {
  final String imageUrl;
  final String make;
  final String model;
  final String year;
  final String licensePlate;

  const VehicleDetails({
    required this.imageUrl,
    required this.make,
    required this.model,
    required this.year,
    required this.licensePlate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [tCharcoal, Color(0xff125670)],
              ),
            ),
            child: Stack(
              children: [
                Container(
                  color: tCharcoal,
                  child: Column(
                    children: [
                      Container(
                        height: SizeConfig.blockSizeVertical! * 40,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  imageUrl,
                                ),
                                fit: BoxFit.cover)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: SizeConfig.blockSizeHorizontal! * 25,
                                    height: SizeConfig.blockSizeVertical! * 7.5,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.arrow_back_ios_new_rounded,
                                          size:
                                              SizeConfig.blockSizeHorizontal! *
                                                  7.5,
                                          color: tWhite,
                                          shadows: [
                                            Shadow(
                                              offset: Offset(2.0, 2.0),
                                              blurRadius: 3.0,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      'Vehicle Details',
                                      style: tInterBold.copyWith(
                                        color: tWhite,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! * 5,
                                        shadows: [
                                          Shadow(
                                            offset: Offset(2.0, 2.0),
                                            blurRadius: 3.0,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: SizeConfig.blockSizeHorizontal! * 25,
                                    height: SizeConfig.blockSizeVertical! * 7.5,
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: SizeConfig.blockSizeVertical! * 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [tCharcoal, Color(0xff125670)],
                      ),
                    ),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 10, 24, 8),
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: "$make ",
                                  style: tInterMedium.copyWith(
                                    color: tWhite,
                                    fontSize:
                                        SizeConfig.blockSizeVertical! * 3.5,
                                  ),
                                ),
                                TextSpan(
                                  text: model,
                                  style: tInterBold.copyWith(
                                    color: tWhite,
                                    fontSize:
                                        SizeConfig.blockSizeVertical! * 3.5,
                                  ),
                                ),
                              ])),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: tOrange,
                            ),
                            height: SizeConfig.blockSizeVertical! * 12,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          year,
                                          style: tInterBold.copyWith(
                                            color: tWhite,
                                            fontSize:
                                                SizeConfig.blockSizeVertical! *
                                                    2.0,
                                          ),
                                        ),
                                        Text(
                                          "Year",
                                          style: tInterRegular.copyWith(
                                            color: tWhite,
                                            fontSize:
                                                SizeConfig.blockSizeVertical! *
                                                    2.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: SizeConfig.blockSizeVertical! * 5.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: tGrey2,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          licensePlate,
                                          style: tInterBold.copyWith(
                                            color: tWhite,
                                            fontSize:
                                                SizeConfig.blockSizeVertical! *
                                                    2.0,
                                          ),
                                        ),
                                        Text(
                                          "License Plate",
                                          style: tInterRegular.copyWith(
                                            color: tWhite,
                                            fontSize:
                                                SizeConfig.blockSizeVertical! *
                                                    2.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Tip: ',
                                  style: tInterBold.copyWith(
                                    color: tWhite,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3.5,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "Enhance your MechaniCALL experience by ensuring your vehicle details are accurate. Easily edit the vehicle image and license plate in the 'Vehicle Details' section. Rest assured, MechaniCALL keeps your license plate information secure, providing you with full control and peace of mind for all your added vehicles.",
                                  style: tInterRegular.copyWith(
                                    color: tWhite,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: tAmaranthPurple,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () async {},
                                child: Icon(
                                  Icons.delete_rounded,
                                  size: SizeConfig.blockSizeHorizontal! * 5,
                                  color: tWhite,
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: tEcru,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () async {},
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "Edit License Plate / Photo",
                                        style: tInterBold.copyWith(
                                            color: tWhite,
                                            fontSize:
                                                SizeConfig.blockSizeVertical! *
                                                    1.5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
