import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';

class PrivacyStatementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: tCharcoal,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [tCharcoal, Color(0xff125670)],
            ),
          ),
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
                          color: tWhite,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Privacy Statement and Legal Information',
                      overflow: TextOverflow.ellipsis,
                      style: tInterSemiBold.copyWith(
                        color: tWhite,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal! * 20,
                    height: SizeConfig.blockSizeVertical! * 7.5,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ListView(
                    children: [
                      Text(
                        'Privacy Statement',
                        style: tInterBold.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 5,
                        ),
                      ),
                      Text(
                        'Last Updated: November 16, 2023',
                        style: tInterSemiBold.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "We at A-AH Inc. operates the MechaniCALL mobile application (the \"App\"). This Privacy Statement informs you of our policies regarding the collection, use, and disclosure of personal information we receive from users of the App.\n\nBy using MechaniCALL, you agree to the collection and use of information in accordance with this Privacy Statement.",
                        style: tInterRegular.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Information Collection and Use',
                        style: tInterBold.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 5,
                        ),
                      ),
                      Text(
                        "• Personal Information: While using MechaniCALL, we may ask you to provide certain personally identifiable information that can be used to contact or identify you. Personal information may include, but is not limited to, your name, email address, phone number, and vehicle information.\n\n• Log Data: Like many app operators, we collect information that your device sends whenever you use MechaniCALL (\"Log Data\"). This Log Data may include information such as your device's Internet Protocol (\"IP\") address, device name, operating system version, configuration of the app when utilizing our service, and other statistics.",
                        style: tInterRegular.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Security',
                        style: tInterBold.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 5,
                        ),
                      ),
                      Text(
                        "The security of your personal information is important to us, but remember that no method of transmission over the Internet or method of electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your personal information, we cannot guarantee its absolute security.",
                        style: tInterRegular.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Legal Information',
                        style: tInterBold.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 5,
                        ),
                      ),
                      Text(
                        'Terms and Conditions',
                        style: tInterSemiBold.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                        ),
                      ),
                      Text(
                        "By downloading and using MechaniCALL, you agree to abide by our Terms and Conditions. Please read these terms carefully before using the App.",
                        style: tInterRegular.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Changes to This Privacy Statement',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: tInterSemiBold.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                        ),
                      ),
                      Text(
                        "This Privacy Statement is effective as of November 16, 2023 and will remain in effect except concerning any changes in its provisions in the future, which will be in effect immediately after being posted on this page.\n\nWe reserve the right to update or change our Privacy Statement at any time, and you should check this Privacy Statement periodically. Your continued use of the App after we post any modifications to the Privacy Statement on this page will constitute your acknowledgment of the modifications and your consent to abide and be bound by the modified Privacy Statement.",
                        style: tInterRegular.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Contact Us',
                        style: tInterBold.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 5,
                        ),
                      ),
                      Text(
                        "If you have any questions about this Privacy Statement, please contact us at support@aahinc.com",
                        style: tInterRegular.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 10,
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
