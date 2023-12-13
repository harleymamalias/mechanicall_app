import 'package:flutter/material.dart';
import '../../app_styles.dart';
import '../../size_config.dart';
import '../../auth_service.dart';
import 'package:provider/provider.dart';

class ManageProfilePage extends StatefulWidget {
  // final Map<String, dynamic>? userDetails;

  // ManageProfilePage({Key? key, this.userDetails}) : super(key: key);

  @override
  _ManageProfilePageState createState() => _ManageProfilePageState();
}

class _ManageProfilePageState extends State<ManageProfilePage> {
  late AuthService _authService;
  late UserProvider _userProvider;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    _initializeControllers();
    _loadCurrentUserDetails();
  }

  void _loadCurrentUserDetails() async {
    try {
      Map<String, dynamic>? userDetails =
          await AuthService().getCurrentUserDetails();

      if (userDetails != null) {
        setState(() {
          _usernameController.text = userDetails['username'] ?? '';
          _firstNameController.text = userDetails['firstname'] ?? '';
          _lastNameController.text = userDetails['lastname'] ?? '';
          _emailController.text = userDetails['email'] ?? '';
          _phoneNumberController.text = userDetails['phoneNumber'] ?? '';

          _userProvider.setUserDetails(userDetails);
        });
      }
    } catch (e) {
      print('Error loading user details: $e');
    }
  }

  void _initializeControllers() {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    _usernameController.text = userProvider.userDetails?['username'] ?? '';
    _firstNameController.text = userProvider.userDetails?['firstname'] ?? '';
    _lastNameController.text = userProvider.userDetails?['lastname'] ?? '';
    _emailController.text = userProvider.userDetails?['email'] ?? '';
    _phoneNumberController.text =
        userProvider.userDetails?['phoneNumber'] ?? '';
  }

  Future<void> _saveChanges() async {
    try {
      await AuthService().updateCurrentUserDetails(
        username: _usernameController.text,
        firstname: _firstNameController.text,
        lastname: _lastNameController.text,
        email: _emailController.text,
        phoneNumber: _phoneNumberController.text,
      );
      _loadCurrentUserDetails();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text('Changes saved successfully'),
          duration: Duration(seconds: 2),
        ),
      );

      await AuthService().refreshUserDetails(context);

      UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);
      userProvider.setUserDetails({
        'username': _usernameController.text,
        'firstname': _firstNameController.text,
        'lastname': _lastNameController.text,
        'email': _emailController.text,
        'phoneNumber': _phoneNumberController.text,
      });

      print('User Details from UserProvider: ${_userProvider.userDetails}');
      print('User UID from UserProvider: ${_userProvider.userDetails?['uid']}');
    } catch (e) {
      print('Error saving changes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: tWhite,
      child: SafeArea(
        child: Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                SizedBox(
                  height: 5,
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
                                    height:
                                        SizeConfig.blockSizeHorizontal! * 20,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: SizeConfig.blockSizeVertical! *
                                              20,
                                          height:
                                              SizeConfig.blockSizeHorizontal! *
                                                  20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/harls.jpg'),
                                              fit: BoxFit.cover,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    tWhite.withOpacity(0.051),
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
                                                padding:
                                                    const EdgeInsets.all(3.0),
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
                                  '${_userProvider.userDetails?['firstname'] ?? ''} ${_userProvider.userDetails?['lastname'] ?? ''}',
                                  style: tInterSemiBold.copyWith(
                                    color: tWhite,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 5,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  _userProvider.userDetails?['phoneNumber'] ??
                                      'Default Number',
                                  style: tInterRegular.copyWith(
                                    color: tWhite2,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3.5,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
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
                                              size: SizeConfig
                                                      .blockSizeHorizontal! *
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
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                3,
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
                    controller: _emailController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      labelText: 'Email',
                      hintStyle: tInterBold.copyWith(
                        color: tCharcoal,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      ),
                    ),
                    enabled: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      labelText: 'Username',
                      hintStyle: tInterBold.copyWith(
                        color: tCharcoal,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      labelText: 'First Name',
                      hintStyle: tInterBold.copyWith(
                        color: tCharcoal,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      labelText: 'Last Name',
                      hintStyle: tInterBold.copyWith(
                        color: tCharcoal,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      labelText: 'Phone Number',
                      hintStyle: tInterBold.copyWith(
                        color: tCharcoal,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      ),
                    ),
                  ),
                ),
                // PasswordTextField(),  TBD
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
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _saveChanges,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: tOrange,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Text(
                          "SAVE",
                          style: tInterBold.copyWith(color: tWhite),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
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
