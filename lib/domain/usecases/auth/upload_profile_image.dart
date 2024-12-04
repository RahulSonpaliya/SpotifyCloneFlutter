import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/base_response.dart';

import '../../../data/models/failure.dart';
import '../../../service_locator.dart';
import '../../repository/auth/auth.dart';

class UploadProfileImageUseCase
    extends UseCase<Either<Failure, BaseResponse>, String> {
  @override
  Future<Either<Failure, BaseResponse>> call({String? param}) async {
    return sl<AuthRepository>().uploadProfileImage(param!);
  }
}
