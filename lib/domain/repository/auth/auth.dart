import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/create_user_req.dart';
import 'package:spotify_clone/data/models/auth/signin_user_req.dart';
import 'package:spotify_clone/data/models/failure.dart';
import 'package:spotify_clone/domain/entities/auth/user.dart';

import '../../../data/models/auth/create_user_response.dart';
import '../../../data/models/auth/signin_user_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, SignInUserResponse>> signIn(
      SignInUserReq signInUserReq);

  Future<Either<Failure, CreateUserResponse>> signUp(
      CreateUserReq createUserReq);

  Future<Either<Failure, UserEntity>> getUser();

  Future<bool> isUserLoggedIn();
}
