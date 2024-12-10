import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/auth/create_user_req.dart';

import '../../../data/models/auth/create_user_response.dart';
import '../../../data/models/failure.dart';
import '../../../service_locator.dart';
import '../../repository/auth/auth.dart';

class SignUpUseCase
    extends UseCase<Either<Failure, CreateUserResponse>, CreateUserReq> {
  @override
  Future<Either<Failure, CreateUserResponse>> call(
      {CreateUserReq? param}) async {
    return sl<AuthRepository>().signUp(param!);
  }
}
