import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../car_owner_page.dart';
import '../service_provider_maintenance_ui/service_provider_homepage.dart';
import 'create_account_options.dart';
import '../widgets/input_fields/password_input_field.dart';
import '../widgets/social_media.dart';
import '../widgets/input_fields/text_input_field.dart';
import '../app_styles.dart';
import '../offline_mode.dart';
import '../auth_service.dart';
import 'package:provider/provider.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthService _authService = AuthService();

  late UserProvider _userProvider; // Declare _userProvider
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  Future<void> _login() async {
    // Check if the user is a car owner or service provider. If the role is determined, redirect users to their corresponding homepages.
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      User user = userCredential.user!;
      String userId = userCredential.user!.uid;
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('car_owners')
          .doc(userId)
          .get();
      if (userSnapshot.exists) {
        Map<String, dynamic>? userDetails =
            await _authService.getCurrentUserDetails();

        _userProvider.setUserDetails({
          'uid': user.uid,
          'username': userDetails?['username'],
          'firstname': userDetails?['firstname'],
          'lastname': userDetails?['lastname'],
          'email': userDetails?['email'],
          'phoneNumber': userDetails?['phoneNumber'],
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else {
        userSnapshot = await FirebaseFirestore.instance
            .collection('service_providers')
            .doc(userId)
            .get();

        if (userSnapshot.exists) {
          Map<String, dynamic>? userDetails =
              await _authService.getCurrentUserDetails();

          _userProvider.setUserDetails({
            'uid': user.uid,
            'username': userDetails?['username'],
            'firstname': userDetails?['firstname'],
            'lastname': userDetails?['lastname'],
            'email': userDetails?['email'],
            'phoneNumber': userDetails?['phoneNumber'],
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ServiceProviderHomePage(),
            ),
          );
        } else {
          //if not car owner or service provider, blablablabla
        }
      }
    } on FirebaseAuthException catch (e) {
      _showLoginErrorDialog(e.message ?? 'An error occurred during login.');
    }
  }

  void _showLoginErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Login Error',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Text(
            errorMessage,
            style: GoogleFonts.inter(
              textStyle: const TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Login to your Account',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 0,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 15),
        TextInputField(
          controller: emailController,
          textPlaceHolder: 'Email',
          textInputType: TextInputType.text,
        ),
        const SizedBox(height: 7),
        PasswordInputField(
          controller: passwordController,
          textPlaceHolder: 'Password',
          textInputType: TextInputType.text,
        ),
        const SizedBox(height: 10),
        const SizedBox(height: 10),
        TextButton(
          onPressed: _login,
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xffD8973C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            elevation: 10,
          ),
          child: Container(
            alignment: Alignment.center,
            height: 40,
            child: Text(
              'Login',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildOfflineModeButton() {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Offline Mode',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              content: Text(
                'You are now in offline mode.',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OfflineMode(),
                      ),
                    );
                  },
                  child: Text(
                    'OK',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      style: TextButton.styleFrom(
        backgroundColor: tGrey3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 10,
      ),
      child: Container(
        alignment: Alignment.center,
        height: 40,
        child: Text(
          'Offline Mode',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff273E47),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/login-signup-logo.png',
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildLoginForm(),
                    _buildOfflineModeButton(),
                    const SizedBox(height: 30),
                    const SocialMedia(),
                    const SizedBox(height: 30),
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateAccountOptionsPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xffD8C99B),
                                ),
                              ),
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
        ),
      ),
    );
  }
}
