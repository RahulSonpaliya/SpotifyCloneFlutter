import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/signin_user_req.dart';
import 'package:spotify_clone/data/models/failure.dart';

import '../../../data/models/auth/signin_user_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, SignInUserResponse>> signIn(
      SignInUserReq signInUserReq);
}
