import 'package:badges/badges.dart' as b;
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:maahi_lms/src/cores/cores.dart';
import 'package:maahi_lms/src/data/dummies/users_dummy.dart';
import 'package:maahi_lms/src/data/dummies/video_courses_dummy.dart';
import 'package:share_plus/share_plus.dart';

import '../../../models/course/video_course.dart';
import '../../../models/user/user.dart';
import '../../widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User user;
  final myCourses = <VideoCourse>[];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<void> loadData() async {
    user = usersJSON
        .map((e) => User.fromJson(e))
        .firstWhere((e) => e.uid == "qwerty123");
    myCourses
      ..clear()
      ..addAll(videoCoursesJSON.reversed.map((e) => VideoCourse.fromJson(e)));
    myCourses.removeAt(0);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading
          ? const SizedBox()
          : AppPullRefresh(
              onRefresh: loadData,
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _ProfileHeader(user: user),
                    const PremiumCard(),
                    LearnedCard(
                      onPressed: () {},
                      currentLearned: 3,
                      targetLearned: 10,
                    ),
                    MyCourseCard(courses: myCourses),
                    const _MenuButtons(),
                    const _ActionButton(),
                  ],
                ),
              ),
            ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final User user;

  const _ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          PhotoAvatar(
            photoURL: user.profile.avatarURL,
            membership: user.membership,
            progress: user.leveling.progress,
            color: context.theme.primaryColor,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.7),
                    child: Text(user.profile.fullName, style: p21.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.7),
                    child: Text(user.profile.email, style: p14.bold.grey),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: b.Badge(
                animationType: b.BadgeAnimationType.scale,
                animationDuration: const Duration(milliseconds: 200),
                badgeColor: Colors.red[400]!.withOpacity(0.9),
                badgeContent: const Text(
                  '7',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                child: const Icon(LineIcons.bell, size: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuButtons extends StatefulWidget {
  const _MenuButtons({super.key});

  @override
  State<_MenuButtons> createState() => _MenuButtonsState();
}

class _MenuButtonsState extends State<_MenuButtons> {
  final lightModeNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    lightModeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              child: Text("Other", style: p20.bold),
            ),
            ItemListCard(
              onPressed: () =>
                  lightModeNotifier.value = !lightModeNotifier.value,
              icon: LineIcons.sunAlt,
              name: "Light Mode",
              iconSize: 26.5,
              trailing: SizedBox(
                height: 17,
                child: ValueListenableBuilder(
                  valueListenable: lightModeNotifier,
                  builder: (_, lightModel, __) {
                    return Switch.adaptive(
                      value: lightModel,
                      onChanged: (value) {
                        lightModeNotifier.value = value;
                      },
                    );
                  },
                ),
              ),
            ),
            ItemListCard(
              onPressed: () => Share.share("Hey I found a best education app"),
              icon: LineIcons.gift,
              name: "Invite friends",
            ),
            ItemListCard(
              onPressed: () {},
              icon: LineIcons.userShield,
              name: "User Agreement",
            ),
            ItemListCard(
              onPressed: () {},
              icon: LineIcons.questionCircleAlt,
              iconSize: 26.5,
              name: "Help and Feedback",
            ),
            ItemListCard(
              onPressed: () {},
              icon: LineIcons.cog,
              name: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton.icon(
        onPressed: () {
          DialogUtils.confirm(
            context: context,
            content: "Are you sure to sign out?",
            lottiePath: LottiePath.thinking,
            onYesClicked: () {},
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red[300],
          padding: const EdgeInsets.symmetric(vertical: 12),
          elevation: 0.2,
          textStyle: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        icon: const Icon(
          LineIcons.alternateSignOut,
          size: 27,
          color: Colors.white,
        ),
        label: Text("Sign Out", style: p21.white),
      ),
    );
  }
}
