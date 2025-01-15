part of '../widgets.dart';

class ItemListCard extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final String name;
  final String? data;
  final Widget? trailing;
  final VoidCallback? onPressed;

  const ItemListCard({
    super.key,
    required this.icon,
    required this.name,
    this.data,
    this.onPressed,
    this.trailing,
    this.iconSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 50,
              child: Icon(icon, size: iconSize, color: AppColors.grey),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(name, style: p16.grey),
              ),
            ),
            SizedBox(
              child: trailing ??
                  const Icon(
                    Icons.chevron_right,
                    size: 24,
                    color: AppColors.grey,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
