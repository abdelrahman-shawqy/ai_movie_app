import 'package:ai_movie_app/features/person/presentation/widgets/profile_colors.dart';
import 'package:flutter/material.dart';


/// A bordered card with a section title and a list of tiles separated by
/// inset dividers.
class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  /// Divider starts after the circular icon (46 icon + 18 gap).
  static const double _dividerIndent = 64;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      decoration: BoxDecoration(
        color: ProfileColors.background,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ProfileColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.titleLarge?.copyWith(
              color: ProfileColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          for (var i = 0; i < children.length; i++) ...[
            children[i],
            if (i != children.length - 1)
              const Divider(
                height: 1,
                thickness: 1,
                indent: _dividerIndent,
                color: ProfileColors.divider,
              ),
          ],
        ],
      ),
    );
  }
}
