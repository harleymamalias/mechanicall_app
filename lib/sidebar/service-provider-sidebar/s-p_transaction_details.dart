import 'package:flutter/material.dart';
import '../../app_styles.dart';
import '../../size_config.dart';

class ServiceProviderTransactionDetails extends StatelessWidget {
  final String eventType;
  final String date;
  final String serviceDetails;
  final String serviceProviderName;
  final String vehicleImage;
  final String vehicleMake;
  final String vehicleModel;

  const ServiceProviderTransactionDetails({
    required this.eventType,
    required this.date,
    required this.serviceDetails,
    required this.serviceProviderName,
    required this.vehicleImage,
    required this.vehicleMake,
    required this.vehicleModel,
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
                                  vehicleImage,
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
                                      'My Transactions',
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
                            child: Text(
                              eventType,
                              style: tInterBold.copyWith(
                                color: tWhite,
                                fontSize: SizeConfig.blockSizeVertical! * 3.5,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: tAmaranthPurple,
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
                                          vehicleModel,
                                          textAlign: TextAlign.center,
                                          style: tInterBold.copyWith(
                                            color: tWhite,
                                            fontSize:
                                                SizeConfig.blockSizeVertical! *
                                                    1.7,
                                          ),
                                        ),
                                        Text(
                                          vehicleMake,
                                          textAlign: TextAlign.center,
                                          style: tInterRegular.copyWith(
                                            color: tWhite,
                                            fontSize:
                                                SizeConfig.blockSizeVertical! *
                                                    1.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Container(
                                      width: 1,
                                      height:
                                          SizeConfig.blockSizeVertical! * 5.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: tGrey2,
                                      ),
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
                                          date,
                                          textAlign: TextAlign.center,
                                          style: tInterBold.copyWith(
                                            color: tWhite,
                                            fontSize:
                                                SizeConfig.blockSizeVertical! *
                                                    1.7,
                                          ),
                                        ),
                                        Text(
                                          "Date",
                                          textAlign: TextAlign.center,
                                          style: tInterRegular.copyWith(
                                            color: tWhite,
                                            fontSize:
                                                SizeConfig.blockSizeVertical! *
                                                    1.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Container(
                                      width: 1,
                                      height:
                                          SizeConfig.blockSizeVertical! * 5.5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: tGrey2,
                                      ),
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
                                          serviceProviderName,
                                          textAlign: TextAlign.center,
                                          style: tInterBold.copyWith(
                                            color: tWhite,
                                            fontSize:
                                                SizeConfig.blockSizeVertical! *
                                                    1.7,
                                          ),
                                        ),
                                        Text(
                                          "Service Provider",
                                          textAlign: TextAlign.center,
                                          style: tInterRegular.copyWith(
                                            color: tWhite,
                                            fontSize:
                                                SizeConfig.blockSizeVertical! *
                                                    1.5,
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
                                  text: 'Service Details: ',
                                  style: tInterBold.copyWith(
                                    color: tWhite,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3.5,
                                  ),
                                ),
                                TextSpan(
                                  text: serviceDetails,
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
                        //
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
