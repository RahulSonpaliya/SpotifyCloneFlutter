import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/create_user_req.dart';
import 'package:spotify_clone/data/models/auth/create_user_response.dart';
import 'package:spotify_clone/data/models/auth/signin_user_req.dart';
import 'package:spotify_clone/data/sources/auth/auth_service.dart';
import 'package:spotify_clone/domain/entities/auth/user.dart';
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

  @override
  Future<Either<Failure, CreateUserResponse>> signUp(
      CreateUserReq createUserReq) async {
    return await sl<AuthService>().signUp(createUserReq);
  }

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    return await sl<AuthService>().getUser();
  }

  @override
  Future<bool> isUserLoggedIn() async {
    return await sl<AuthService>().isUserLoggedIn();
  }

  @override
  Future<void> signOut() async {
    await sl<AuthService>().signOut();
  }
}
