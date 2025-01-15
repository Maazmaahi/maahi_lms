part of '../widgets.dart';

class PhotoAvatar extends StatelessWidget {
  final String? photoURL;
  final String? heroTag;
  final String? membership;
  final int? progress;
  final Color? color;
  final bool? isHideProgressBar;

  const PhotoAvatar({
    super.key,
    required this.photoURL,
    this.heroTag,
    this.membership,
    this.progress = 0,
    this.color,
    this.isHideProgressBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: width,
      child: isHideProgressBar!
          ? photoURL?.isEmpty ?? true
              ? emptyPhotoBorder(context)
              : Hero(
                  tag: "avatar${heroTag ?? Random().nextInt(100).toString()}",
                  child: CachedNetworkImage(
                    imageUrl: photoURL!,
                    errorWidget: (context, url, error) =>
                        const CircleAvatar(maxRadius: 27),
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                      maxRadius: 27,
                      backgroundColor: Colors.white,
                      backgroundImage: imageProvider,
                    ),
                  ),
                )
          : Stack(
              children: [
                CircularStepProgressIndicator(
                  padding: 0,
                  currentStep: progress!,
                  totalSteps: 100,
                  selectedStepSize: 3.7,
                  width: 65,
                  height: 65,
                  startingAngle: 2.3,
                  selectedColor: color ?? Colors.yellow[600],
                  roundedCap: (_, __) => true,
                  child: Center(
                    child: photoURL?.isEmpty ?? true
                        ? emptyPhoto(context)
                        : Hero(
                            tag:
                                "avatar${heroTag ?? Random().nextInt(100).toString()}",
                            child: CachedNetworkImage(
                              imageUrl: photoURL!,
                              errorWidget: (context, url, error) =>
                                  const CircleAvatar(maxRadius: 27),
                              imageBuilder: (context, imageProvider) =>
                                  CircleAvatar(
                                maxRadius: 27,
                                backgroundColor: Colors.white,
                                backgroundImage: imageProvider,
                              ),
                            ),
                          ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: -2,
                  child: b.Badge(
                    shape: b.BadgeShape.square,
                    animationType: b.BadgeAnimationType.scale,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2.2,
                    ),
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(13),
                    badgeColor: color ?? Colors.yellow[600]!,
                    elevation: 0,
                    badgeContent: Text(
                      membership ?? "Free",
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget emptyPhoto(BuildContext context) {
    return Hero(
      tag: "empty-avatar${heroTag ?? Random().nextInt(100).toString()}",
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 70,
        child: Center(
          child: Icon(
            LineIcons.alternateUser,
            size: 50,
            color: context.theme.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget emptyPhotoBorder(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: context.theme.primaryColor,
          width: 1,
        ),
      ),
      child: Hero(
        tag:
            "empty-avatar-border${heroTag ?? Random().nextInt(100).toString()}",
        child: CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 70,
          child: Center(
            child: Icon(
              LineIcons.alternateUser,
              size: 50,
              color: context.theme.colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
