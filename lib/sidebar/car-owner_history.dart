import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';
import '../sidebar/transaction_card.dart';

class CarOwnerHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
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
                      serviceDetails:
                          "I've been noticing a subtle decrease in the responsiveness of my car's brakes, and it feels like they're not gripping as effectively as before. For safety reasons, I'd like a comprehensive check and repair for the braking system. Additionally, as a responsible car owner, I'm keen on learning about the routine monthly maintenance tasks I should perform to keep my car in optimal condition. Your guidance on this matter would be greatly appreciated. Looking forward to your expertise in ensuring my vehicle's safety and longevity.",
                      serviceProviderName: 'AA Daisuc',
                      vehicleImage: 'assets/images/mustang.jpg',
                      vehicleMake: 'Ford',
                      vehicleModel: 'Mustang',
                    ),
                    TransactionCard(
                      eventType: 'Roadside Assistance',
                      date: '2022-11-15 10:30 AM',
                      serviceDetails:
                          "I found myself stranded on the roadside today due to a flat tire. It seems the tire has worn out over time, and unfortunately, I wasn't able to replace it myself. I'm in need of urgent assistance to either repair or replace the tire. Additionally, if you could check the battery, as I suspect it might have run out, it would be greatly appreciated. Your prompt support in resolving these issues and getting me back on the road safely would mean a lot. Thank you in advance for your assistance.",
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
      ),
    );
  }
}
