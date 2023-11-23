import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechanicall_app/payments/proceed_to_payment.dart';

class SelectPaymentMethod extends StatefulWidget {
  const SelectPaymentMethod({super.key});

  @override
  State<SelectPaymentMethod> createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  int type = 1;

  void handleRadio(Object? e) => setState(() {
        type = e as int;
      });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff273E47),
      appBar: AppBar(
        title: const Text('Payment Details'),
        leading: const BackButton(),
        backgroundColor: const Color(0xffD8973C),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                'Choose Payment Method',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: size.width,
                height: 55,
                decoration: BoxDecoration(
                  border: type == 1
                      ? Border.all(width: 2, color: const Color(0xffD8973C))
                      : Border.all(
                          width: 1, color: const Color.fromARGB(255, 0, 0, 0)),
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20.0,
                      left: 10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              value: 1,
                              groupValue: type,
                              onChanged: handleRadio,
                              activeColor: Colors.black,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Paypal',
                              style: type == 1
                                  ? const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )
                                  : const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/paypal.png',
                          width: 80,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: size.width,
                height: 55,
                decoration: BoxDecoration(
                  border: type == 2
                      ? Border.all(width: 1, color: const Color(0xffD8973C))
                      : Border.all(
                          width: 1, color: const Color.fromARGB(255, 0, 0, 0)),
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20.0,
                      left: 10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              value: 2,
                              groupValue: type,
                              onChanged: handleRadio,
                              activeColor: Colors.black,
                            ),
                            Text(
                              'Google Pay',
                              style: type == 2
                                  ? const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )
                                  : const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/google-pay.png',
                          width: 80,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: size.width,
                height: 55,
                decoration: BoxDecoration(
                  border: type == 3
                      ? Border.all(width: 1, color: const Color(0xffD8973C))
                      : Border.all(
                          width: 1, color: const Color.fromARGB(255, 0, 0, 0)),
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20.0,
                      left: 10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              value: 3,
                              groupValue: type,
                              onChanged: handleRadio,
                              activeColor: Colors.black,
                            ),
                            Text(
                              'Amazon Pay',
                              style: type == 3
                                  ? const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )
                                  : const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/amazon-pay.png',
                          width: 80,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: size.width,
                height: 55,
                decoration: BoxDecoration(
                  border: type == 4
                      ? Border.all(width: 1, color: const Color(0xffD8973C))
                      : Border.all(
                          width: 1, color: const Color.fromARGB(255, 0, 0, 0)),
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20.0,
                      left: 10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              value: 4,
                              groupValue: type,
                              onChanged: handleRadio,
                              activeColor: Colors.black,
                            ),
                            Text(
                              'GCash',
                              style: type == 4
                                  ? const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )
                                  : const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/paypal.png',
                          width: 80,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: size.width,
                height: 55,
                decoration: BoxDecoration(
                  border: type == 5
                      ? Border.all(width: 1, color: const Color(0xffD8973C))
                      : Border.all(
                          width: 1, color: const Color.fromARGB(255, 0, 0, 0)),
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20.0,
                      left: 10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              value: 5,
                              groupValue: type,
                              onChanged: handleRadio,
                              activeColor: Colors.black,
                            ),
                            Text(
                              'Cash',
                              style: type == 5
                                  ? const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )
                                  : const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/amazon-pay.png',
                          width: 80,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const PaymentSuccessfulMessage(),
            ],
          ),
        ),
      ),
    );
  }
}
