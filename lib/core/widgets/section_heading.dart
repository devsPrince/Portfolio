import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';

class SectionHeading extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isDark;

  const SectionHeading({
    super.key,
    required this.title,
    this.subtitle,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Container(
            //   width: 24,
            //   height: 3,
            //   decoration: BoxDecoration(
            //     color: AppColors.accent,
            //     borderRadius: BorderRadius.circular(2),
            //   ),
            // ),
            // const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.sectionHeading(isDark),
              ),
            ),
          ],
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 6),
          Text(
            subtitle!,
            style: AppTextStyles.body(isDark),
          ),
        ],
      ],
    );
  }
}
