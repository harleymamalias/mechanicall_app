import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';

class DataBackupPage extends StatefulWidget {
  @override
  _DataBackupPageState createState() => _DataBackupPageState();
}

class _DataBackupPageState extends State<DataBackupPage> {
  bool isBackupInProgress = false;
  bool isRestoreEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [tCharcoal, Color(0xff125670)],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: tCharcoal,
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
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
                    Center(
                      child: Text(
                        'Data Backup and Restore',
                        style: tInterBold.copyWith(
                          color: tWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 5,
                        ),
                      ),
                    ),
                    Container(
                      width: SizeConfig.blockSizeHorizontal! * 15,
                      height: SizeConfig.blockSizeVertical! * 7.5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: ListView(
                    children: [
                      Center(
                        child: Text(
                          'Simple. Secure. Effortless Data Management',
                          style: tInterRegular.copyWith(
                            color: tWhite,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          'Secure Your Preferences, Retrieve Anytime',
                          style: tInterBold.copyWith(
                            color: tWhite,
                            fontSize: SizeConfig.blockSizeHorizontal! * 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: tAmaranthPurple,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            onPressed: () async {
                              setState(() {
                                isBackupInProgress = true;
                                isRestoreEnabled = false;
                              });
                              await Future.delayed(Duration(seconds: 4));
                              setState(() {
                                isBackupInProgress = false;
                                isRestoreEnabled = true;
                              });
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Backup Successful",
                                      style: tInterSemiBold,
                                    ),
                                    content: Text(
                                      "Your data has been backed up.",
                                      style: tInterMedium,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          "OK",
                                          style: tInterBold.copyWith(
                                              color: tAmaranthPurple),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text("Backup Data",
                                style: tInterBold.copyWith(
                                  color: tWhite,
                                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                                )),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: tOrange,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            onPressed: isRestoreEnabled
                                ? () {
                                    // Show the success dialog
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            "Restore Successful",
                                            style: tInterSemiBold,
                                          ),
                                          content: Text(
                                            "Your data has been restored.",
                                            style: tInterMedium,
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                "OK",
                                                style: tInterBold.copyWith(
                                                    color: tOrange),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                : null,
                            child: Text("Restore Data",
                                style: tInterBold.copyWith(
                                  color: tWhite,
                                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (isBackupInProgress)
                        Center(
                          child: CircularProgressIndicator(
                            color: tAmaranthPurple,
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: tAmaranthPurple, width: 2.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(
                                  'Tips for Data Backup',
                                  style: tInterBold.copyWith(
                                    color: tWhite,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 4,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(
                                  '• Ensure a stable internet connection for efficient backup and restoration\n'
                                  '• Regularly update your backup to include the latest information.\n'
                                  '• Store your backup file in a secure cloud service for added reliability.\n',
                                  style: tInterRegular.copyWith(
                                    color: tWhite,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: tOrange, width: 2.5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(
                                'Important Note',
                                style: tInterBold.copyWith(
                                  color: tWhite,
                                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(
                                '• MechaniCALL prioritizes your privacy. All backed-up data is encrypted for enhanced security.\n'
                                '• Your backup file is accessible only to you, ensuring privacy and confidentiality. \n',
                                style: tInterRegular.copyWith(
                                  color: tWhite,
                                  fontSize: SizeConfig.blockSizeHorizontal! * 3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
