part of '../widgets.dart';

class PremiumCard extends StatelessWidget {
  const PremiumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: context.screenWidth,
      margin:
          const EdgeInsets.only(right: 18.5, left: 18.5, top: 10, bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF292929),
        borderRadius: BorderRadius.circular(25),
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            top: 15,
                            bottom: 6,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black26,
                                  border: Border.all(
                                      color: const Color(0xFFF0BF41)),
                                ),
                                child: SvgPicture.asset(
                                  Assets.iconsSVG.premium,
                                  height: 13,
                                  width: 13,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text("Get Premium", style: p18.yellow),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text("Go to the next English level",
                                style: p14.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 11,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          colors: [
                            AppColors.lightyellow,
                            AppColors.yellow,
                          ],
                        ),
                      ),
                      child: Text("Subscribe", style: p14.brown),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: context.screenWidth,
            padding: const EdgeInsets.all(13),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
              color: Color(0xFF363535),
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIconButton(
                    icon: LineIcons.book,
                    label: "Courses",
                    onPressed: () {},
                  ),
                  VerticalDivider(
                    width: 3,
                    thickness: 1,
                    color: const Color(0xFF909090).withOpacity(0.3),
                  ),
                  _buildIconButton(
                    icon: LineIcons.video,
                    label: "Live",
                    onPressed: () {},
                  ),
                  VerticalDivider(
                    width: 3,
                    thickness: 1,
                    color: const Color(0xFF909090).withOpacity(0.3),
                  ),
                  _buildIconButton(
                    icon: LineIcons.graduationCap,
                    label: "Featured",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String label,
    required void Function() onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFF9DB8F)),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, color: Color(0xFF909090)),
            ),
          ),
        ],
      ),
    );
  }
}