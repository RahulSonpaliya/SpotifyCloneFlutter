import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/auth/create_user_req.dart';

import '../../models/auth/create_user_response.dart';
import '../../models/auth/signin_user_req.dart';
import '../../models/auth/signin_user_response.dart';
import '../../models/failure.dart';

abstract class AuthService {
  Future<Either<Failure, SignInUserResponse>> signIn(
      SignInUserReq signInUserReq);

  Future<Either<Failure, CreateUserResponse>> signUp(
      CreateUserReq createUserReq);
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

  @override
  Future<Either<Failure, CreateUserResponse>> signUp(
      CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(data.user?.uid)
          .set({
        'name': createUserReq.fullName,
        'email': data.user?.email,
      });
      return Right(
        CreateUserResponse(
          message: 'Sign up was successful',
        ),
      );
    } catch (e) {
      String msg = 'something went wrong!';
      if (e is FirebaseAuthException) {
        if (e.code == 'weak-password') {
          msg = 'The password provided is too weak';
        } else if (e.code == 'email-already-in-use') {
          msg = 'An account already exist with that email.';
        }
      }
      return Left(Failure(0, msg));
    }
  }
}
