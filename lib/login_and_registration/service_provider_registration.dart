import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'user_login_page.dart';
import '../widgets/certifications_and_qualifications.dart';
import '../widgets/input_fields/email_address_input_field.dart';
import '../widgets/input_fields/password_input_field.dart';
import '../widgets/input_fields/phone_number_input_field.dart';
import '../widgets/social_media.dart';
import '../widgets/terms_and_conditions.dart';
import '../widgets/input_fields/text_input_field.dart';

class ServiceProviderRegistrationPage extends StatefulWidget {
  const ServiceProviderRegistrationPage({super.key});

  @override
  State<ServiceProviderRegistrationPage> createState() =>
      _ServiceProviderRegistrationPageState();
}

class _ServiceProviderRegistrationPageState
    extends State<ServiceProviderRegistrationPage> {
  final FirebaseAuth serviceProviderAuth = FirebaseAuth.instance;
  final FirebaseFirestore serviceProviderFirestore = FirebaseFirestore.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController serviceproviderNameController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  bool? isChecked = false;

  Future<void> registerServiceProvider() async {
    try {
      UserCredential serviceProviderCredential =
          await serviceProviderAuth.createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      await serviceProviderFirestore
          .collection('service_providers')
          .doc(serviceProviderCredential.user?.uid)
          .set({
        'email': emailController.text,
        'username': usernameController.text,
        'firstname': firstnameController.text,
        'lastname': lastnameController.text,
        'phoneNumber': phoneNumberController.text,
      });
      _showRegistrationCompletedDialog();
    } catch (e) {
      print('Error during registration: $e');
    }
  }

  void _showRegistrationCompletedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Registration Completed',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Text(
            'Your account registration has been completed! You will be redirected to the login page.',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserLoginPage(),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff273E47),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                              'assets/images/login-signup-logo.png'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Register an account to continue.',
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        EmailInputField(
                          controller: emailController,
                          textPlaceHolder: 'Email',
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        PasswordInputField(
                          controller: passwordController,
                          textPlaceHolder: 'Password',
                          textInputType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        TextInputField(
                          controller: usernameController,
                          textPlaceHolder: 'Service Provider Name',
                          textInputType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        TextInputField(
                          controller: firstnameController,
                          textPlaceHolder: 'First Name',
                          textInputType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        TextInputField(
                          controller: lastnameController,
                          textPlaceHolder: 'Last Name',
                          textInputType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        PhoneNumberInputField(
                          controller: phoneNumberController,
                          textPlaceHolder: 'Phone Number',
                          textInputType: TextInputType.phone,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        // ImagePickerWidget(),
                        BrowseCertificationsWidget(),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: isChecked,
                              activeColor: const Color(0xffD8973C),
                              side: const BorderSide(
                                color: Colors.white,
                              ),
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const TermsAndConditionsAndPrivacyPolicy(),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  height: 40,
                                  child: RichText(
                                    text: const TextSpan(
                                      text:
                                          'I acknowledge that I agree to the ',
                                      style: TextStyle(color: Colors.white),
                                      children: [
                                        TextSpan(
                                          text: 'Terms of Use',
                                          style: TextStyle(
                                            color: Colors.white,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' and have read the ',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        TextSpan(
                                          text: 'Privacy Policy',
                                          style: TextStyle(
                                            color: Colors.white,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '.',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            registerServiceProvider();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xffA4243B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            elevation: 10,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            child: Text(
                              'Register',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const SocialMedia(),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account?',
                                style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const UserLoginPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Sign In',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
