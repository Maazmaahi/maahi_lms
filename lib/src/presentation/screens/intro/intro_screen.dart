import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maahi_lms/src/presentation/widgets/widgets.dart';

import '../../../cores/cores.dart';
import '../../../routes/routes_name.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  static final imagesPath = <String>[
    Assets.imagesSVG.teaching,
    Assets.imagesSVG.studying,
    Assets.imagesSVG.onlineLearning,
  ];

  static const Map<String, String> _introText = {
    "intro_page_title_1": "Speak with confidence",
    "intro_page_subtitle_1":
        "Get talking from lesson one, with conversation-based learning.",
    "intro_page_title_2": "Learn at you pace",
    "intro_page_subtitle_2":
        "Build a learning habit and make it part of your day.",
    "intro_page_title_3": "Lessons that work for you",
    "intro_page_subtitle_3": "Learn and retain, with a mix of learning styles.",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: IntroSlider(
                items: imagesPath.map((item) {
                  return IntroModel(
                    imagePath: item,
                    title: _introText[
                        'intro_page_title_${(imagesPath.indexOf(item) + 1)}']!,
                    subTitle: _introText[
                        'intro_page_subtitle_${(imagesPath.indexOf(item) + 1)}']!,
                  );
                }).toList(),
              ),
            ),
            Column(
              children: [
                AppRoundedButton(
                  onPressed: () {
                    context.go(RoutesName.home);
                  },
                  label: "Next",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Do you have an account?",
                      style: p17,
                    ),
                    const SizedBox(width: 4),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Login",
                        style: p17,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
