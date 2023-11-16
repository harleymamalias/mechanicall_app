import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_config.dart';

class ManageProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
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
                    'Manage Profile',
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                height: SizeConfig.blockSizeVertical! * 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: tOrange,
                  boxShadow: [
                    BoxShadow(
                      color: tMidnightBlue.withOpacity(0.051),
                      offset: const Offset(0.0, 3.0),
                      blurRadius: 24.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical! * 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'History',
                            style: tInterRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: tWhite,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: SizeConfig.blockSizeHorizontal! * 3,
                              color: tWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: tCharcoal,
                        boxShadow: [
                          BoxShadow(
                            color: tMidnightBlue.withOpacity(0.051),
                            offset: const Offset(0.0, 3.0),
                            blurRadius: 24.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      height: SizeConfig.blockSizeVertical! * 27,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10, 16, 10, 10.0),
                            child: Center(
                              child: Container(
                                height: SizeConfig.blockSizeHorizontal! * 15,
                                child: Column(
                                  children: [
                                    Container(
                                      width: SizeConfig.blockSizeVertical! * 15,
                                      height:
                                          SizeConfig.blockSizeHorizontal! * 15,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/harls.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: tWhite.withOpacity(0.051),
                                            offset: const Offset(0.0, 3.0),
                                            blurRadius: 15.0,
                                            spreadRadius: 2.0,
                                          ),
                                        ],
                                      ),
                                      child: Align(
                                        alignment: Alignment(0.5, 0.5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: tOrange,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Icon(
                                              Icons.edit_rounded,
                                              size: SizeConfig
                                                      .blockSizeHorizontal! *
                                                  3.5,
                                              color: tWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Harley Mamalias',
                              style: tInterSemiBold.copyWith(
                                color: tWhite,
                                fontSize: SizeConfig.blockSizeHorizontal! * 5,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '+63 9545 214 912',
                              style: tInterRegular.copyWith(
                                color: tWhite2,
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              height: SizeConfig.blockSizeVertical! * 4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: tWhite,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8.0, 0, 4, 0),
                                        child: Icon(
                                          Icons.workspace_premium_rounded,
                                          size:
                                              SizeConfig.blockSizeHorizontal! *
                                                  5,
                                          color: tCharcoal,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0.0),
                                        child: Text(
                                          'Premium',
                                          style: tInterSemiBold.copyWith(
                                            color: tCharcoal,
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                3.5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      'verified',
                                      style: tInterRegular.copyWith(
                                        color: tCharcoal,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! * 3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    labelText: 'Username',
                    hintText: 'Edit Username',
                    hintStyle: tInterBold.copyWith(
                      color: tCharcoal,
                      fontSize: SizeConfig.blockSizeHorizontal! * 4,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    labelText: 'First Name',
                    hintText: 'Edit First Name',
                    hintStyle: tInterBold.copyWith(
                      color: tCharcoal,
                      fontSize: SizeConfig.blockSizeHorizontal! * 4,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    labelText: 'Last Name',
                    hintText: 'Edit Last Name',
                    hintStyle: tInterBold.copyWith(
                      color: tCharcoal,
                      fontSize: SizeConfig.blockSizeHorizontal! * 4,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    labelText: 'Email',
                    hintText: 'Edit Email',
                    hintStyle: tInterBold.copyWith(
                      color: tCharcoal,
                      fontSize: SizeConfig.blockSizeHorizontal! * 4,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    labelText: 'Phone Number',
                    hintText: 'Edit Phone Number',
                    hintStyle: tInterBold.copyWith(
                      color: tCharcoal,
                      fontSize: SizeConfig.blockSizeHorizontal! * 4,
                    )),
              ),
            ),
            PasswordTextField(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "CANCEL",
                        style: tInterBold,
                      )),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tOrange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(24), // BorderRadius
                        ),
                      ),
                      child: Text(
                        "SAVE",
                        style: tInterBold.copyWith(color: tWhite),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        obscureText: _obscureText,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
            ),
            contentPadding: EdgeInsets.all(5),
            labelText: 'Password',
            hintText: 'Enter Password',
            hintStyle: tInterBold.copyWith(
              color: tCharcoal,
              fontSize: SizeConfig.blockSizeHorizontal! * 4,
            )),
      ),
    );
  }
}
