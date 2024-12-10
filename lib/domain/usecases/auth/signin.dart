import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/auth/signin_user_req.dart';

import '../../../data/models/auth/signin_user_response.dart';
import '../../../data/models/failure.dart';
import '../../../service_locator.dart';
import '../../repository/auth/auth.dart';

class SignInUseCase
    extends UseCase<Either<Failure, SignInUserResponse>, SignInUserReq> {
  @override
  Future<Either<Failure, SignInUserResponse>> call(
      {SignInUserReq? param}) async {
    return sl<AuthRepository>().signIn(param!);
  }
}
