import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:maahi_lms/src/cores/cores.dart';
import 'package:maahi_lms/src/data/dummies/live_courses_dummy.dart';
import 'package:maahi_lms/src/ext/animated_dialog/dialog.dart';
import 'package:maahi_lms/src/models/models.dart';
import 'package:maahi_lms/src/presentation/widgets/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class LiveCoursesScreen extends StatefulWidget {
  const LiveCoursesScreen({super.key});

  @override
  State<LiveCoursesScreen> createState() => _LiveCoursesScreenState();
}

class _LiveCoursesScreenState extends State<LiveCoursesScreen> {
  final liveCourses = <LiveCourse>[];

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<void> loadData() async {
    liveCourses
      ..clear()
      ..addAll(List<LiveCourse>.from(
          liveCoursesJSON.map((e) => LiveCourse.fromJson(e))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        centerTitle: false,
        title: Text(
          'Live Course',
          style: context.theme.textTheme.titleLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                AppIcons.calendar,
                size: 25,
                color: AppColors.grey,
              ),
            ),
          ),
        ],
      ),
      body: AppPullRefresh(
        onRefresh: loadData,
        child: SingleChildScrollView(
          primary: true,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18)
                    .copyWith(bottom: 10),
                child: Text(
                  "Wonderful live courses, interact with teachers",
                  style: p14.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 0),
                child: ListView.separated(
                  primary: false,
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                  shrinkWrap: true,
                  itemCount: liveCourses.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 17),
                  itemBuilder: (context, index) {
                    final item = liveCourses[index];

                    return LiveCourseCard(
                        item: item,
                        onPressed: () {
                          showAnimatedDialog(
                            context: context,
                            animationType: DialogTransitionType.slideFromBottom,
                            curve: Curves.ease,
                            barrierColor: Colors.black.withOpacity(0.8),
                            builder: (_) => _AppointmentDialog(item: item),
                          );
                        });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _AppointmentDialog extends StatelessWidget {
  final LiveCourse item;

  const _AppointmentDialog({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    const radius = 20.0;
    final width = context.screenWidth * 0.9;
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Ink(
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(radius),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: width,
                    child: CachedNetworkImage(
                      imageUrl: item.imageUrl,
                      errorWidget: (context, url, error) => const SizedBox(),
                      imageBuilder: (context, assetProvider) {
                        return ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(radius)),
                          child: FadeInImage(
                            placeholder: MemoryImage(kTransparentImage),
                            image: assetProvider,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title.overflow,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: p22.bold,
                        ),
                        const SizedBox(height: 17),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: UserInfo(
                                onPressed: () {},
                                title: item.teacher.name,
                                titleStyle: p14.grey,
                                avatarURL: item.teacher.avatarURL,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.watch_later_outlined,
                                  color: AppColors.grey,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  item.liveTime
                                      .toDDMMhmmaFormat()
                                      .toLowerCase(),
                                  style: p14.grey,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 17),
                    child: AppRoundedButton(
                      onPressed: () => context.pop(),
                      label: "Appointment Now",
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: SvgPicture.asset(
                          Assets.iconsSVG.premium,
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            IconButton(
              onPressed: context.maybePop,
              icon: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white,
                      width: 2,
                    ),),
                child: const Icon(
                  Icons.close_rounded,
                  color: AppColors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
