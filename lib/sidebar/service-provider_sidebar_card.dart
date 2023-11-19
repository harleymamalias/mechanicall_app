import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';
import '../sidebar/privacy-statement.dart';
import '../sidebar/report_issue.dart';
import '../sidebar/car-owner_d_backup.dart';
import 'service-provider_certifications_page.dart';
import 'service-provider_history.dart';
import 'service-provider_profile.dart';

class ServiceProviderSidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      backgroundColor: tCharcoal,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: tCharcoal,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/meksel.jpg'),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Manoy Mexl',
                    style: tInterRegular.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: SizeConfig.blockSizeHorizontal! * 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 2, 0, 8),
            child: ExpansionTile(
              leading: Icon(
                Icons.person,
                color: tWhite,
              ),
              title: Text(
                'Profile',
                style: tInterRegular.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: Text(
                      'Manage Profile',
                      style: tInterRegular.copyWith(
                        color: Colors.white,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ManageServiceProviderProfilePage()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: Text(
                      'Certifications & Qualifications',
                      style: tInterRegular.copyWith(
                        color: Colors.white,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CertificationsQualifications()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: Text(
                      'View History',
                      style: tInterRegular.copyWith(
                        color: Colors.white,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ServiceProviderHistoryPage()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: Text(
                      'View Feedbacks and Ratings',
                      style: tInterRegular.copyWith(
                        color: Colors.white,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => ServiceProviderFeedback()),
                      // );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 0, 8.0),
            child: ExpansionTile(
              leading: Icon(
                Icons.settings,
                color: tWhite,
              ),
              title: Text(
                'Settings',
                style: tInterRegular.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: Text(
                      'Report Issue',
                      style: tInterRegular.copyWith(
                        color: Colors.white,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReportIssuePage()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: Text(
                      'Data Backup and Restore',
                      style: tInterRegular.copyWith(
                        color: Colors.white,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DataBackupPage()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: Text(
                      'Privacy Statement and Legal Information',
                      style: tInterRegular.copyWith(
                        color: Colors.white,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrivacyStatementPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 0, 8.0),
            child: ListTile(
              leading: Icon(
                Icons.logout_rounded,
                color: tWhite,
              ),
              title: Text(
                'Log Out',
                style: tInterRegular.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                ),
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => PrivacyStatementPage()),
                // );
              },
            ),
          )
        ],
      ),
    );
  }
}
