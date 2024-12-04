import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spotify_clone/domain/entities/auth/user.dart';
import 'package:spotify_clone/domain/usecases/auth/get_user.dart';
import 'package:spotify_clone/domain/usecases/auth/upload_profile_image.dart';
import 'package:spotify_clone/presentation/profile/bloc/profile_info_state.dart';

import '../../../service_locator.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit() : super(ProfileInfoLoading());

  Future<void> getUser() async {
    var result = await sl<GetUserUseCase>().call();
    result.fold(
      (failure) => emit(ProfileInfoFailure()),
      (userEntity) {
        this.userEntity = userEntity;
        emit(ProfileInfoLoaded(userEntity: userEntity));
      },
    );
  }

  late UserEntity userEntity;
  XFile? updatedUserImage;

  void userImagePicked(XFile updatedUserImage) async {
    this.updatedUserImage = updatedUserImage;
    emit(ProfileInfoLoaded(
      userEntity: userEntity,
      updatedUserImage: updatedUserImage,
    ));
    var result = await sl<UploadProfileImageUseCase>()
        .call(param: updatedUserImage.path);
    result.fold(
      (failure) {},
      (response) => getUser(),
    );
  }
}
