import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showLogo;
  final bool showBackButton;
  final String? titleText;
  final List<Widget>? actions;
  final Color bgColor;

  const BasicAppBar({
    super.key,
    this.showLogo = false,
    this.showBackButton = false,
    this.titleText,
    this.actions,
    this.bgColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      centerTitle: showLogo || titleText != null,
      title: showLogo
          ? SvgPicture.asset(
              AppVectors.logo,
              height: 40,
            )
          : titleText != null
              ? Text(
                  titleText!,
                  style: const TextStyle(fontSize: 18),
                )
              : null,
      leading: showBackButton
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? Colors.white.withOpacity(0.03)
                      : Colors.black.withOpacity(0.03),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                  color: context.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            )
          : const SizedBox.shrink(),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
