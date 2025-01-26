import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maahi_lms/src/presentation/widgets/widgets.dart';
import 'package:pinput/pinput.dart';

import '../../../cores/cores.dart';
import '../../../routes/routes_name.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  String validPin = "1234";

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Edu Maahi",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Pinput(
                        defaultPinTheme: PinTheme(
                          width: 56,
                          height: 56,
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w600),
                          decoration: BoxDecoration(
                            border: Border.all(color: colorScheme.primary),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 56,
                          height: 56,
                          textStyle: const TextStyle(
                              fontSize: 20,
                              color: AppColors.green,
                              fontWeight: FontWeight.w600),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.green),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          return value == validPin ? null : "Pin is incorrect";
                        },
                        onCompleted: (pin) {
                          print("Pin is sucess :- $validPin");
                        },
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: AppRoundedButton(
                              label: 'validate',
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  LocalStorage.setBool(
                                      LocalStorage.isLoggedIn, true);
                                  context.go(RoutesName.home);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Please correct your otp.')),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
