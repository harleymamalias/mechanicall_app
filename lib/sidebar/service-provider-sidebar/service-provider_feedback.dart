import 'package:flutter/material.dart';
import '../../app_styles.dart';
import '../../size_config.dart';
import 'service-provider_feedback_card.dart';

class ServiceProviderFeedbacksPage extends StatelessWidget {
  const ServiceProviderFeedbacksPage({super.key});

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
                    width: SizeConfig.blockSizeHorizontal! * 22,
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
                      'Feedbacks Received',
                      style: tInterRegular.copyWith(
                        fontWeight: FontWeight.w600,
                        color: tCharcoal,
                        fontSize: SizeConfig.blockSizeHorizontal! * 5,
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal! * 22,
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
                    ServiceProviderFeedbackCard(
                      eventType: 'Appointment',
                      date: '2023-11-15 10:30 AM',
                      serviceDetails:
                          "I've been noticing a subtle decrease in the responsiveness of my car's brakes, and it feels like they're not gripping as effectively as before. For safety reasons, I'd like a comprehensive check and repair for the braking system. Additionally, as a responsible car owner, I'm keen on learning about the routine monthly maintenance tasks I should perform to keep my car in optimal condition. Your guidance on this matter would be greatly appreciated. Looking forward to your expertise in ensuring my vehicle's safety and longevity.",
                      serviceProviderName: 'Manoy Mexl',
                      vehicleImage: 'assets/images/mustang.jpg',
                      vehicleMake: 'Ford',
                      vehicleModel: 'Mustang',
                      rating: 4,
                      feedback:
                          "Exceptional service! The mechanic arrived on time, diagnosed the issue quickly, and efficiently fixed my car. The entire process was smooth, and the pricing was fair. I appreciate the professionalism and expertise of the MechaniCALL team. Will definitely use their services again and recommend to others!",
                    ),
                    ServiceProviderFeedbackCard(
                      eventType: 'Roadside Assistance',
                      date: '2023-11-19 06:50 AM',
                      serviceDetails:
                          "I encountered an unexpected situation this morning as my car's battery suddenly died, leaving me stranded. The dashboard indicated that the battery is depleted. I've tried jump-starting it, but it doesn't seem to work. In addition, my front right tire appears to have lost air, and it might need either a quick repair or replacement. I would greatly appreciate your urgent assistance in jump-starting the car and addressing the tire issue. Your prompt response will be a lifesaver. Thank you so much for your help!",
                      serviceProviderName: 'Manoy Mexl',
                      vehicleImage: 'assets/images/camry.jpg',
                      vehicleMake: 'Toyota',
                      vehicleModel: 'Camrry',
                      rating: 5,
                      feedback:
                          "I recently had my car serviced by MechaniCALL and I must say, the experience was exceptional. The staff was friendly and knowledgeable. The service was completed in a timely manner, and my car is running smoothly. I appreciate the attention to detail and the transparent communication throughout the process. MechaniCALL has earned my trust, and I will definitely be a returning customer. Highly recommended!",
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
