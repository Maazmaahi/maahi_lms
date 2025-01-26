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
    final colorScheme = context.colorScheme;
    final TextStyle textGrayStyle = p15.grey;
    const radius = 10.0;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(radius),
      child: Ink(
        height: 160,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [BoxShadow(color: colorScheme.shadow, blurRadius: 3)],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 160,
                  width: 110,
                  child: CachedNetworkImage(
                    imageUrl: item.imageUrl,
                    errorWidget: (context, url, error) => const SizedBox(),
                    imageBuilder: (context, assetProvider) {
                      return ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(radius),
                          bottomLeft: Radius.circular(radius),
                        ),
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
            // const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
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
                              maxRadius: 12,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item.title.overflow,
                              style:
                                  p18.bold.copyWith(color: colorScheme.onSurface),
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
                              horizontal: 6, vertical: 4),
                          decoration: BoxDecoration(
                            color: context.theme.primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            item.liveTime
                                .toStringByFormat("dd-MM h:mm a")
                                .toLowerCase(),
                            style: p14.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4.5),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              item.level,
                              overflow: TextOverflow.ellipsis,
                              style: p14,
                            ),
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
    );
  }
}
