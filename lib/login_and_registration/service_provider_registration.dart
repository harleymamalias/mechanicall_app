import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechanicall_app/login_and_registration/user_login_page.dart';
import 'package:mechanicall_app/widgets/certifications_and_qualifications.dart';
import 'package:mechanicall_app/widgets/input_fields/email_address_input_field.dart';
import 'package:mechanicall_app/widgets/input_fields/password_input_field.dart';
import 'package:mechanicall_app/widgets/input_fields/phone_number_input_field.dart';
import 'package:mechanicall_app/widgets/registration_completed_message.dart';
import 'package:mechanicall_app/widgets/social_media.dart';
import 'package:mechanicall_app/widgets/terms_and_conditions.dart';
import 'package:mechanicall_app/widgets/input_fields/text_input_field.dart';

class ServiceProviderRegistrationPage extends StatefulWidget {
  const ServiceProviderRegistrationPage({super.key});

  @override
  State<ServiceProviderRegistrationPage> createState() =>
      _ServiceProviderRegistrationPageState();
}

class _ServiceProviderRegistrationPageState
    extends State<ServiceProviderRegistrationPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  bool? isChecked = false;
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
                              "assets/images/login-signup-logo.png"),
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
                        TextInputField(
                          controller: usernameController,
                          textPlaceHolder: 'Username',
                          textInputType: TextInputType.text,
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
                        TextInputField(
                          controller: lastnameController,
                          textPlaceHolder: 'Service Provider Name',
                          textInputType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        EmailInputField(
                          controller: emailController,
                          textPlaceHolder: 'Email',
                          textInputType: TextInputType.emailAddress,
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
                        const RegistrationCompletedMessage(),
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
                                      builder: (context) => UserLoginPage(),
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
