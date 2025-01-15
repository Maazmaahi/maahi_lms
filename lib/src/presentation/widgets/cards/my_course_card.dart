part of '../widgets.dart';

class MyCourseCard extends StatelessWidget {
  final List<VideoCourse> courses;

  const MyCourseCard({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.only(right: 18.5, left: 18.5, top: 4, bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(Assets.images.blackBackground),
          fit: BoxFit.fill,
        ),
        boxShadow: [
          BoxShadow(color: Colors.grey[200]!, blurRadius: 8),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SubHeader(
              title: "My Courses",
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 23),
          SizedBox(
            width: context.screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: courses
                  .take(2)
                  .map(
                    (item) => buildMyCourse(
                      context: context,
                      imageUrl: item.imageUrl,
                      onPressed: () {},
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget buildMyCourse({
    required BuildContext context,
    required String imageUrl,
    required void Function() onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: onPressed,
        child: Stack(
          children: [
            SizedBox(
              // height: 100,
              // width: 100,
              height: context.screenWidth * 0.38,
              width: context.screenWidth * 0.38,
              child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  errorWidget: (context, url, error) => const SizedBox(),
                  imageBuilder: (context, assetProvider) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeInImage(
                        placeholder: MemoryImage(kTransparentImage),
                        image: assetProvider,
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
