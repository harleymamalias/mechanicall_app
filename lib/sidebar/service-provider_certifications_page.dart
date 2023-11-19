import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';
import 'certification_q_card.dart';

class CertificationsQualifications extends StatelessWidget {
  const CertificationsQualifications({super.key});

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
                          color: tCharcoal,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal! * 60,
                    child: Center(
                      child: Text(
                        'Certifications & Qualifications',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: tInterRegular.copyWith(
                          fontWeight: FontWeight.w600,
                          color: tCharcoal,
                          fontSize: SizeConfig.blockSizeHorizontal! * 5,
                        ),
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
                child: ListView(
                  children: [
                    CertificationCard(
                      imagePath: "assets/images/cert1.png",
                      year: "2018",
                    ),
                    CertificationCard(
                      imagePath: "assets/images/cert2.png",
                      year: "2017",
                    ),
                    // VehicleCard(
                    //   imagePath: 'assets/images/civic.jpg',
                    //   make: 'Honda',
                    //   model: 'Civic',
                    //   year: '2022',
                    //   licensePlate: 'DEF-456',
                    // ),
                    // VehicleCard(
                    //   imagePath: 'assets/images/camry.jpg',
                    //   make: 'Toyota',
                    //   model: 'Camry',
                    //   year: '2018',
                    //   licensePlate: 'ABC-123',
                    // ),
                    // VehicleCard(
                    //   imagePath: 'assets/images/mustang.jpg',
                    //   make: 'Ford',
                    //   model: 'Mustang',
                    //   year: '2020',
                    //   licensePlate: 'XYZ-789',
                    // ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: tCharcoal,
            onPressed: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddVehicleDialog();
                },
              );
            },
            child: Icon(
              Icons.add,
              color: tWhite,
            ),
          ),
        ),
      ),
    );
  }
}

class AddVehicleDialog extends StatefulWidget {
  @override
  _AddVehicleDialogState createState() => _AddVehicleDialogState();
}

class _AddVehicleDialogState extends State<AddVehicleDialog> {
  late String imageUrl;
  late String make;
  late String model;
  late String year;
  late String licensePlate;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Add Certifications / Qualification",
        style: tInterBold,
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  // Show file picker to choose image
                  // FilePickerResult? result =
                  //     await FilePicker.platform.pickFiles(
                  //         // type: FileType.image,
                  //         );
                  // if (result != null) {
                  //   PlatformFile file = result.files.first;
                  //   print(file.name);
                  //   print(file.bytes);
                  //   print(file.extension);
                  //   print(file.path);
                  // } else {
                  //   //function if user cancels the picker
                  // }
                },
                child: Text(
                  "Upload Image",
                  style: tInterSemiBold.copyWith(),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 5,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  // Show year picker
                  // DatePicker.showDatePicker(
                  //   context,
                  //   showTitleActions: true,
                  //   minTime: DateTime(DateTime.now().year - 10, 1),
                  //   maxTime: DateTime(2025),
                  //   onConfirm: (date) {
                  //     setState(() {
                  //       year = date.year.toString();
                  //     });
                  //   },
                  //   currentTime: DateTime.now(),
                  // );
                },
                child: Text("Year of Certification",
                    style: tInterSemiBold.copyWith()),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Close dialog
            Navigator.pop(context);
          },
          child: Text("Cancel", style: tInterSemiBold.copyWith()),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: tOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          onPressed: () {
            // Show success dialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Successfully Added"),
                  content: Text(
                      "Your Certification / Qualification has been added."),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("OK", style: tInterSemiBold.copyWith()),
                    ),
                  ],
                );
              },
            );
          },
          child: Text("Add", style: tInterSemiBold.copyWith(color: tWhite)),
        ),
      ],
    );
  }
}
