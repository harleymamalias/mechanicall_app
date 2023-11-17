import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';
import '../sidebar/transaction_card.dart';

class CarOwnerHistoryPage extends StatelessWidget {
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
                    'My Transactions',
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
                  TransactionCard(
                    eventType: 'Appointment',
                    date: '2022-11-15 10:30 AM',
                    serviceDetails: 'Service Details blabla blabla bla',
                    serviceProviderName: 'Manoy Daisuc',
                    vehicleImage: 'assets/images/mustang.jpg',
                    vehicleMake: 'Ford',
                    vehicleModel: 'Mustang',
                  ),
                  TransactionCard(
                    eventType: 'Roadside Assistance',
                    date: '2022-11-15 10:30 AM',
                    serviceDetails: 'Service Details blabla blabla bla',
                    serviceProviderName: 'Manoy Mexl',
                    vehicleImage: 'assets/images/civic.jpg',
                    vehicleMake: 'Honda',
                    vehicleModel: 'Civic',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
