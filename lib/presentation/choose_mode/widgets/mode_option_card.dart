import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/configs/theme/app_colors.dart';

class ModeOptionCard extends StatelessWidget {
  final String modeTitle;
  final String modeIconPath;

  const ModeOptionCard({
    super.key,
    required this.modeTitle,
    required this.modeIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff30393c).withOpacity(0.5),
              ),
              child: SvgPicture.asset(
                modeIconPath,
                fit: BoxFit.none,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          modeTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.grey,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
