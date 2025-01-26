part of "../widgets.dart";

class IntroModel {
  final String imagePath, title, subTitle;

  const IntroModel({
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });
}

class IntroSlider extends StatefulWidget {
  final List<IntroModel> items;

  const IntroSlider({super.key, required this.items});

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  final selectedImageNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    selectedImageNotifier.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ValueListenableBuilder(
        valueListenable: selectedImageNotifier,
        builder: (context, currentImage, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: buildImagesPage()),
            widget.items.length > 1
                ? SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.items
                          .map((image) => _buildIndicator(
                              widget.items.indexOf(image) == currentImage))
                          .toList(),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget buildImagesPage() {
    final colorScheme = context.colorScheme;
    return PageView(
      physics: const BouncingScrollPhysics(),
      onPageChanged: (value) => selectedImageNotifier.value = value,
      children: widget.items.map(
        (item) {
          String ext = item.imagePath.split('.').last;

          double height = 200;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ext != "svg"
                      ? Image.asset(
                          item.imagePath,
                          fit: BoxFit.scaleDown,
                          height: height,
                        )
                      : SvgPicture.asset(
                          item.imagePath,
                          fit: BoxFit.scaleDown,
                          height: height,
                        ),
                ),
                const SizedBox(height: 55),
                Text(item.title, style: p23.bold.copyWith(color: colorScheme.onSurface), textAlign: TextAlign.center),
                const SizedBox(height: 22),
                Text(item.subTitle,
                    style: p16.grey, textAlign: TextAlign.center),
              ],
            ),
          );
        },
      ).toList(),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF42A5F5) : Colors.grey[400],
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
