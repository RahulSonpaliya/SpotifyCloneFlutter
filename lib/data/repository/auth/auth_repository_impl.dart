import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/signin_user_req.dart';
import 'package:spotify_clone/data/sources/auth/auth_service.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';
import '../../models/auth/signin_user_response.dart';
import '../../models/failure.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either<Failure, SignInUserResponse>> signIn(
      SignInUserReq signInUserReq) async {
    return await sl<AuthService>().signIn(signInUserReq);
  }
}
