part of '../widgets.dart';

class LiveCourseCard extends StatelessWidget {
  final LiveCourse item;
  final Function()? onPressed;

  const LiveCourseCard({
    super.key,
    required this.item,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle textGrayStyle = TextStyle(
      color: AppColors.grey,
      fontSize: 15,
    );
    const radius = 15.0;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(radius),
      child: Ink(
        height: 160,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [BoxShadow(color: Colors.grey[200]!, blurRadius: 3)],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 140,
                  width: 100,
                  child: CachedNetworkImage(
                    imageUrl: item.imageUrl,
                    errorWidget: (context, url, error) => const SizedBox(),
                    imageBuilder: (context, assetProvider) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage(
                          placeholder: MemoryImage(kTransparentImage),
                          image: assetProvider,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black38,
                    ),
                    child: SvgPicture.asset(
                      Assets.iconsSVG.premium,
                      height: 13,
                      width: 13,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3, bottom: 6),
                          child: UserInfo(
                            onPressed: () {},
                            title: item.teacher.name,
                            avatarURL: item.teacher.avatarURL,
                            maxRadius: 10,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            item.title.overflow,
                            style: p18.bold,
                            maxLines: 2,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Expanded(
                          child: Text(
                            item.liveDuration,
                            style: textGrayStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: context.theme.primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          item.liveTime
                              .toStringByFormat("dd-MM h:mm a")
                              .toLowerCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4.5),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            item.level,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
