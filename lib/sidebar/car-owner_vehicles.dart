import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';
import '../sidebar/vehicle_card.dart';

class OwnedVehiclesPage extends StatelessWidget {
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
                      'Owned Vehicles',
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
                    VehicleCard(
                      imagePath: 'assets/images/civic.jpg',
                      make: 'Honda',
                      model: 'Civic',
                      year: '2022',
                      licensePlate: 'DEF-456',
                    ),
                    VehicleCard(
                      imagePath: 'assets/images/camry.jpg',
                      make: 'Toyota',
                      model: 'Camry',
                      year: '2018',
                      licensePlate: 'ABC-123',
                    ),
                    VehicleCard(
                      imagePath: 'assets/images/mustang.jpg',
                      make: 'Ford',
                      model: 'Mustang',
                      year: '2020',
                      licensePlate: 'XYZ-789',
                    ),
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
            onPressed: () async {},
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
