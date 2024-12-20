import 'package:flutter/material.dart';
import 'package:maahi_lms/src/cores/cores.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Profile Screen",
        style: context.theme.textTheme.titleLarge,
      ),
    );
  }
}
