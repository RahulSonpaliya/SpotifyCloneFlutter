import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/auth/signin_user_req.dart';
import '../../models/auth/signin_user_response.dart';
import '../../models/failure.dart';

abstract class AuthService {
  Future<Either<Failure, SignInUserResponse>> signIn(SignInUserReq signInUserReq);
}

class AuthFirebaseService extends AuthService {
  @override
  Future<Either<Failure, SignInUserResponse>> signIn(
      SignInUserReq signInUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInUserReq.email,
        password: signInUserReq.password,
      );
      return Right(
        SignInUserResponse(
          message: 'Sign in was successful',
        ),
      );
    } catch (e) {
      String msg = 'something went wrong!';
      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-email') {
          msg = 'Email is invalid';
        } else if (e.code == 'invalid-credential') {
          msg = 'Wrong password is provided for that user';
        }
      }
      return Left(Failure(0, msg));
    }
  }
}
