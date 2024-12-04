import 'package:image_picker/image_picker.dart';
import 'package:spotify_clone/domain/entities/auth/user.dart';

abstract class ProfileInfoState {}

class ProfileInfoLoading extends ProfileInfoState {}

class ProfileInfoLoaded extends ProfileInfoState {
  final UserEntity userEntity;
  XFile? updatedUserImage;

  ProfileInfoLoaded({required this.userEntity, this.updatedUserImage});
}

class ProfileInfoFailure extends ProfileInfoState {}
