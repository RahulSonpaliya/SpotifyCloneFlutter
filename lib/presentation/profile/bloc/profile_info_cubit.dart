import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/auth/get_user.dart';
import 'package:spotify_clone/presentation/profile/bloc/profile_info_state.dart';

import '../../../service_locator.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit() : super(ProfileInfoLoading());

  Future<void> getUser() async {
    var result = await sl<GetUserUseCase>().call();
    result.fold(
      (failure) => emit(ProfileInfoFailure()),
      (userEntity) => emit(ProfileInfoLoaded(userEntity: userEntity)),
    );
  }
}
