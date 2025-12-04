import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_spacing.dart';

enum MoodType {
  positive,
  negative,
  neutral,
}

class MoodButton extends StatelessWidget {
  final String label;
  final MoodType type;
  final VoidCallback onTap;

  const MoodButton({
    super.key,
    required this.label,
    required this.type,
    required this.onTap,
  });

  Color _getColor() {
  switch (type) {
    case MoodType.positive:
      return AppColors.positive;
    case MoodType.negative:
      return const Color.fromRGBO(248, 81, 73, 1);
    case MoodType.neutral:
      return AppColors.neutral;
  }
}


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: AppColors.glassEffect,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColors.glassBorder,
          ),
        ),
        child: Text(
          label,
          style: AppTypography.componentTitle.copyWith(
            color: _getColor(),
          ),
        ),
      ),
    );
  }
}
