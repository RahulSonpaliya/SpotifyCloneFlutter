import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/helpers/image_picker_utils.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/presentation/profile/bloc/profile_info_cubit.dart';

import '../bloc/profile_info_state.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileInfoCubit()..getUser(),
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.isDarkMode ? const Color(0xff2c2b2b) : Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
            builder: (context, state) {
          if (state is ProfileInfoLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProfileInfoLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 140,
                  width: 140,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:
                            context.read<ProfileInfoCubit>().updatedUserImage !=
                                    null
                                ? FutureBuilder(
                                    future: context
                                        .read<ProfileInfoCubit>()
                                        .updatedUserImage!
                                        .readAsBytes(),
                                    builder: (_, snapshot) {
                                      if (snapshot.hasData) {
                                        return Image.memory(
                                          fit: BoxFit.cover,
                                          height: 125,
                                          width: 125,
                                          snapshot.data!,
                                        );
                                      }
                                      return const SizedBox.shrink();
                                    },
                                  )
                                : CachedNetworkImage(
                                    height: 125,
                                    width: 125,
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) =>
                                        Image.asset(AppImages.defaultUserImage),
                                    imageUrl: state.userEntity.imageUrl!,
                                  ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () async {
                            final pickedImage = await ImagePickerUtil
                                .showCameraOrGalleryChooser(context);
                            if (pickedImage != null) {
                              context
                                  .read<ProfileInfoCubit>()
                                  .userImagePicked(pickedImage);
                            }
                          },
                          icon: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Text(state.userEntity.email!),
                const SizedBox(height: 10),
                Text(
                  state.userEntity.fullName!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            );
          }
          if (state is ProfileInfoFailure) {
            return const Text('Please try again');
          }
          return const SizedBox.shrink();
        }),
      ),
    );
  }
}
