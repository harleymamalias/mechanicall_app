import 'package:flutter/material.dart';
import '../../app_styles.dart';
import '../../size_config.dart';
import 'car-owner_profile.dart';
import 'car-owner_vehicles.dart';
import 'car-owner_history.dart';
import 'premium_page.dart';
import '../sidebar-general-pages/privacy-statement.dart';
import '../sidebar-general-pages/report_issue.dart';
import '../sidebar-general-pages/data_backup.dart';

class CarOwnerSidebarCard extends StatelessWidget {
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
                    backgroundImage: AssetImage('assets/images/harls.jpg'),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Harley Mamalias',
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
                            builder: (context) => ManageProfilePage()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: Text(
                      'Owned Vehicles',
                      style: tInterRegular.copyWith(
                        color: Colors.white,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OwnedVehiclesPage()),
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
                            builder: (context) => CarOwnerHistoryPage()),
                      );
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
                      'Premium Services and Payments',
                      style: tInterRegular.copyWith(
                        color: Colors.white,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PremiumServicesPage()),
                      );
                    },
                  ),
                ),
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
