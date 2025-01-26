part of '../widgets.dart';

class LearnedCard extends StatelessWidget {
  const LearnedCard({
    super.key,
    required this.currentLearned,
    required this.targetLearned,
    this.onPressed,
  });

  final int currentLearned, targetLearned;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(right: 18, left: 18, bottom: 20, top: 8),
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          padding: const EdgeInsets.all(14),
          height: 120,
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: colorScheme.shadow, blurRadius: 10),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: const Color(0xFF2F80ED).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SvgPicture.asset(
                  Assets.iconsSVG.calendar,
                  width: 50,
                  height: 50,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Learned today',
                        style: context.theme.textTheme.titleLarge,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: currentLearned.toString(),
                                style: p26.bold.copyWith(
                                  color: colorScheme.onSurface,
                                ),
                                children: [
                                  TextSpan(
                                    text: "/$targetLearned",
                                    style: p19.bold.copyWith(
                                      color: colorScheme.onSurface,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'minute',
                              style: context.theme.textTheme.headlineSmall
                                  ?.copyWith(
                                fontSize: 20,
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CircularStepProgressIndicator(
                padding: 0,
                currentStep: currentLearned,
                totalSteps: targetLearned,
                selectedStepSize: 3.7,
                unselectedStepSize: 3.7,
                width: 60,
                height: 60,
                unselectedColor: const Color(0xFFEEF0F3),
                roundedCap: (_, __) => true,
                child: Center(
                  child: Text(
                    "${(currentLearned / targetLearned * 100).round()}%",
                    style: p15.bold.copyWith(color: colorScheme.onSurface),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
