import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';
import 's-p_transaction_details.dart';

class ServiceProviderTransactionCard extends StatelessWidget {
  final String eventType;
  final String date;
  final String serviceDetails;
  final String serviceProviderName;
  final String vehicleImage;
  final String vehicleMake;
  final String vehicleModel;

  ServiceProviderTransactionCard({
    required this.eventType,
    required this.date,
    required this.serviceDetails,
    required this.serviceProviderName,
    required this.vehicleImage,
    required this.vehicleMake,
    required this.vehicleModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
      child: Container(
        height: SizeConfig.blockSizeVertical! * 20,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [tCharcoal, Color(0xff125670)],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Container(
                height: SizeConfig.blockSizeVertical! * 10,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      '$vehicleMake $vehicleModel',
                      style: tInterBold.copyWith(
                        color: tWhite,
                        fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 12, 4),
                        child: Text(
                          'Service Provider Name',
                          style: tInterRegular.copyWith(
                            color: tWhite,
                            fontSize: SizeConfig.blockSizeHorizontal! * 2.8,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 12, 8),
                        child: Text(
                          serviceProviderName,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: tInterSemiBold.copyWith(
                            color: tWhite,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: tOrange,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3, 3, 12, 3),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ServiceProviderTransactionDetails(
                                  eventType: eventType,
                                  date: date,
                                  serviceDetails: serviceDetails,
                                  serviceProviderName: serviceProviderName,
                                  vehicleImage: vehicleImage,
                                  vehicleMake: vehicleMake,
                                  vehicleModel: vehicleModel,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "View Details",
                            style: tInterSemiBold.copyWith(
                              color: tAlloyOrange,
                              fontSize: SizeConfig.blockSizeVertical! * 2,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
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
