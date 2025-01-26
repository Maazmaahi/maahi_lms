import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maahi_lms/src/cores/cores.dart';
import 'package:maahi_lms/src/presentation/widgets/widgets.dart';

import '../../../routes/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mobileController = TextEditingController();
  final _mobileFocus = FocusNode();

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.dismissKeyboard();
      context.push(RoutesName.otp);
    }
    // else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //         content:
    //         Text('Please correct your mobile number.')),
    //   );
    // }
  }

  @override
  void dispose() {
    _mobileController.dispose();
    super.dispose();
  }

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Text(
                        "Login/Sign UP",
                        style: p18.copyWith(color: colorScheme.onSurface),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Enter mobile number for OTP",
                        style: p14.grey,
                      ),
                      const SizedBox(height: 20),
                      AppTextFormField(
                        controller: _mobileController,
                        ownFocus: _mobileFocus,
                        labelText: 'Mobile Number',
                        hintText: 'Enter your mobile number',
                        keyboardType: TextInputType.phone,
                        prefixIcon: Icons.phone,
                        maxLength: 10,
                        onChanged: (value) {
                          print("Input: $value");
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Mobile number is required';
                          }
                          if (value.length != 10) {
                            return 'Mobile number must be 10 digits';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 60),
                      const Spacer(),
                      AppRoundedButton(
                        onPressed: _submit,
                        label: "Sign In",
                      )
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
