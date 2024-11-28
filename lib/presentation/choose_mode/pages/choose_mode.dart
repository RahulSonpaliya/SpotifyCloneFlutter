import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/presentation/choose_mode/bloc/theme_cubit.dart';

import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../widgets/mode_option_card.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AppImages.chooseModeBg,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 40,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                const Spacer(),
                const Text(
                  'Choose Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ModeOptionCard(
                      modeTitle: 'Dark Mode',
                      modeIconPath: AppVectors.moon,
                      onTap: () => context
                          .read<ThemeCubit>()
                          .updateTheme(ThemeMode.dark),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ModeOptionCard(
                      modeTitle: 'Light Mode',
                      modeIconPath: AppVectors.sun,
                      onTap: () => context
                          .read<ThemeCubit>()
                          .updateTheme(ThemeMode.light),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                BasicAppButton(
                  onPressed: () {},
                  title: 'Continue',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
