import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';

class ReportIssuePage extends StatefulWidget {
  @override
  _ReportIssuePageState createState() => _ReportIssuePageState();
}

class _ReportIssuePageState extends State<ReportIssuePage> {
  bool consentChecked = false;
  TextEditingController issueTypeController = TextEditingController();
  TextEditingController severityController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    issueTypeController.dispose();
    severityController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      color: tWhite,
      child: SafeArea(
        child: Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
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
                        'Report Issues',
                        style: tInterBold.copyWith(
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
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: tOrange, width: 2.5),
                            color: tWhite,
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Issue Details',
                                  style: tInterBold.copyWith(
                                    color: tCharcoal,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 5,
                                  ),
                                ),
                                buildIssueTypeDropdown(),
                                SizedBox(
                                  height: 10,
                                ),
                                buildSeverityDropdown(),
                                SizedBox(
                                  height: 10,
                                ),
                                buildDescriptionTextField(),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: tOrange, width: 2.5),
                            color: tWhite,
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Environment Details',
                                  style: tInterBold.copyWith(
                                    color: tCharcoal,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 5,
                                  ),
                                ),
                                buildNetworkConnectionDropdown(),
                                SizedBox(
                                  height: 10,
                                ),
                                buildFrequencyDropdown(),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                        buildConsentCheckbox(),
                        SizedBox(
                          height: 10,
                        ),
                        // buildContactInformation(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: tOrange,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: consentChecked ? () => submitForm() : null,
                          child: Text('Submit'),
                        ),
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

  Widget buildIssueTypeDropdown() {
    const List<String> issueTypes = [
      'Bug',
      'Feature Request',
      'Usability Problem',
      'Others'
    ];

    return DropdownMenu<String>(
      initialSelection: issueTypes.first,
      onSelected: (String? value) {
        // Handle the selected value
      },
      dropdownMenuEntries:
          issueTypes.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }

  Widget buildSeverityDropdown() {
    const List<String> severities = ['Critical', 'Major', 'Minor', 'Cosmetic'];

    return DropdownMenu<String>(
      initialSelection: severities.first,
      onSelected: (String? value) {
        // Handle the selected value
        setState(() {
          severityController.text = value ?? '';
        });
      },
      dropdownMenuEntries:
          severities.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
        );
      }).toList(),
    );
  }

  Widget buildDescriptionTextField() {
    return Container(
      height: SizeConfig.blockSizeVertical! * 15,
      padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
      decoration: BoxDecoration(
        border: Border.all(
          color: tCharcoal, // Add border color if needed
          width: 1.0,
        ),
        borderRadius:
            BorderRadius.circular(8), // Add border radius for rounded corners
      ),
      child: TextField(
        controller: descriptionController,
        maxLines: null, // Allow the text field to expand to multiple lines
        decoration: InputDecoration(
          border: InputBorder.none, // Remove the default border
          hintText: 'Add Description',
          hintStyle: tInterBold.copyWith(
            fontSize: SizeConfig.blockSizeHorizontal! * 4,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildScreenshotAttachment() {
    // Implement your optional upload widget for 'Screenshot/Attachment' here
    return Container();
  }

  Widget buildNetworkConnectionDropdown() {
    const List<String> Netconnection = [
      'Wi-Fi',
      'Mobile Data',
    ];

    return DropdownMenu<String>(
      initialSelection: Netconnection.first,
      onSelected: (String? value) {
        // Handle the selected value
      },
      dropdownMenuEntries:
          Netconnection.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
        );
      }).toList(),
    );
  }

  Widget buildFrequencyDropdown() {
    const List<String> frequency = [
      'Once',
      'Occasionally',
      'Frequently',
      'Every Time',
      'Randomly',
      'Not Sure',
    ];

    return DropdownMenu<String>(
      initialSelection: frequency.first,
      onSelected: (String? value) {
        // Handle the selected value
        setState(() {
          issueTypeController.text = value ?? '';
        });
      },
      dropdownMenuEntries:
          frequency.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
        );
      }).toList(),
    );
  }

  Widget buildConsentCheckbox() {
    return Row(
      children: [
        Checkbox(
          checkColor: tWhite,
          activeColor: tOrange,
          value: consentChecked,
          onChanged: (value) {
            setState(() {
              consentChecked = value ?? false;
            });
          },
        ),
        Container(
          width: SizeConfig.blockSizeHorizontal! * 70,
          child: Text(
            'I consent to the collection of anonymous usage data to improve the app.',
            style: tInterMedium.copyWith(
              color: tCharcoal,
              fontSize: SizeConfig.blockSizeHorizontal! * 3,
            ),
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  void submitForm() {
    // Retrieve values from text fields
    String selectedIssueType = issueTypeController.text;
    String selectedSeverity = severityController.text;
    String description = descriptionController.text;

    // Perform any necessary processing with the form data

    // Show a dialog to inform the user that their report has been sent
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Report Submitted'),
          content: Text(
              'Your report has been sent and will be addressed by the developers as soon as possible.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'OK',
                style: tInterBold,
              ),
            ),
          ],
        );
      },
    );

    // Clear text fields
    issueTypeController.clear();
    severityController.clear();
    descriptionController.clear();
  }
}
