import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/core/configs/constants/app_urls.dart';
import 'package:spotify_clone/data/models/auth/create_user_req.dart';

import '../../../domain/entities/auth/user.dart';
import '../../models/auth/create_user_response.dart';
import '../../models/auth/signin_user_req.dart';
import '../../models/auth/signin_user_response.dart';
import '../../models/auth/user.dart';
import '../../models/failure.dart';

abstract class AuthService {
  Future<Either<Failure, SignInUserResponse>> signIn(
      SignInUserReq signInUserReq);

  Future<Either<Failure, CreateUserResponse>> signUp(
      CreateUserReq createUserReq);

  Future<Either<Failure, UserEntity>> getUser();

  Future<bool> isUserLoggedIn();

  Future<void> signOut();
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

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      final user = await FirebaseFirestore.instance
          .collection('Users')
          .doc(firebaseAuth.currentUser?.uid)
          .get();
      final userModel = UserModel.fromJson(user.data()!);
      userModel.imageUrl =
          firebaseAuth.currentUser?.photoURL ?? AppUrls.defaultUserImage;
      return Right(userModel.toEntity());
    } catch (e) {
      return Left(Failure(0, 'An error occurred'));
    }
  }

  @override
  Future<bool> isUserLoggedIn() async {
    return FirebaseAuth.instance.currentUser != null;
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
