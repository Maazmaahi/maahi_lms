part of '../widgets.dart';

class VideoCourseCard extends StatelessWidget {
  final VideoCourse item;
  final VoidCallback onPressed;

  const VideoCourseCard({
    super.key,
    required this.item,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () => onPressed(),
        child: Ink(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow,
                blurRadius: 3,
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                height: 200.0,
                width: context.screenWidth,
                child: CachedNetworkImage(
                  imageUrl: item.imageUrl,
                  errorWidget: (context, url, error) => const SizedBox(),
                  imageBuilder: (context, assetProvider) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
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
                padding: const EdgeInsets.all(17.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title.overflow,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: p20.bold.copyWith(color: colorScheme.onSurface),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Flexible(
                          child: UserInfo(
                            onPressed: () {},
                            expanded: false,
                            title: item.teacher.name,
                            avatarURL: item.teacher.avatarURL,
                          ),
                        ),
                        const DotContainer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Text(item.level, style: p15.grey),
                        ),
                        const DotContainer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Text(
                            "${item.lessons.length} ${item.lessons.length > 1 ? 'Lessons' : 'Lesson'}",
                            style: p15.grey,
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
      ),
    );
  }
}
