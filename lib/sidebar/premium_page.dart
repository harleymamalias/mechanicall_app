import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';
import '../sidebar/premium_card.dart';

class PremiumServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        size: SizeConfig.blockSizeHorizontal! * 7.5,
                        color: tCharcoal,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Premium Services',
                    style: tInterRegular.copyWith(
                      fontWeight: FontWeight.w600,
                      color: tCharcoal,
                      fontSize: SizeConfig.blockSizeHorizontal! * 5,
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.blockSizeHorizontal! * 25,
                  height: SizeConfig.blockSizeVertical! * 7.5,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Container(
                      height: SizeConfig.blockSizeVertical! * 60,
                      decoration: BoxDecoration(
                        color: tWhite2,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: tCharcoal.withOpacity(0.125),
                            offset: const Offset(0.0, 3.0),
                            blurRadius: 24.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: SizeConfig.blockSizeVertical! * 15,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [tCharcoal, Color(0xff125670)],
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 8, 8, 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: tOrange,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.workspace_premium_rounded,
                                          size:
                                              SizeConfig.blockSizeHorizontal! *
                                                  15,
                                          color: tWhite,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 8, 8, 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Premium Member',
                                          style: tInterBold.copyWith(
                                            color: tWhite,
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                4.5,
                                          ),
                                        ),
                                        Text(
                                          'Exp. on December 2023',
                                          style: tInterRegular.copyWith(
                                            color: tWhite,
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Premium Exclusive Benefits',
                                style: tInterBold.copyWith(
                                  color: tCharcoal,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 4.5,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              PremiumCard(
                                title: 'Discounts',
                                subtitle: 'Get Discounts per Transactions',
                              ),
                              PremiumCard(
                                title: 'Priority',
                                subtitle: 'Quick Response Priority',
                              ),
                              PremiumCard(
                                title: 'Service Response',
                                subtitle: 'Have Faster Service Response Time',
                              ),
                              PremiumCard(
                                title: 'Manage any Fleet',
                                subtitle:
                                    'Handle multiple vehicles effortlessly.',
                              ),
                              PremiumCard(
                                title: 'Choose the Best',
                                subtitle: 'Access top-rated service providers.',
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Text(
                      'Terms & Conditions apply',
                      style: tInterBold.copyWith(
                        color: tCharcoal,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 4, 24, 0),
                    child: Text(
                      '• Premium services operate on a subscription basis with a recurring billing cycle.\n'
                      '• Users are responsible for timely payment. Failure to pay may result in the suspension of premium services. \n'
                      '• Users can cancel their premium subscription at any time. Refunds are not provided for partial subscription periods. \n'
                      '• Premium services include exclusive features, subject to potential changes.\n'
                      '• We reserve the right to terminate premium services for users who violate terms or engage in prohibited activities. \n',
                      style: tInterMedium.copyWith(
                        color: tCharcoal,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
                    child: Text(
                      'By subscribing, you agree to these \nterms and conditions.',
                      style: tInterBold.copyWith(
                        color: tCharcoal,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tOrange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Subscribe",
                          style: tInterBold.copyWith(
                            color: tWhite,
                            fontSize: SizeConfig.blockSizeHorizontal! * 4,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
