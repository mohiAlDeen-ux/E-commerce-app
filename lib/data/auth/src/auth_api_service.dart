import "package:cloud_firestore/cloud_firestore.dart";
import "package:dartz/dartz.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter_application_1/core/error/failures.dart";
import "../models/set_user_info_req.dart";
import "../models/reset_password_py_old_password_req.dart";
import "../models/user_creational_req.dart";
import "../models/user_signin_req.dart";
import '../models/user.dart';

abstract class AuthApiService {
  Future<Either<Failure, void>> signin(UserSigninReq params);
  Future<Either<Failure, void>> signup(UserCreationalReq params);
  Future<Either<Failure, void>> resetPasswordPyOldPassword(
      ResetPasswordPyOldPasswordReq params);
  Future<Either<Failure, void>> sendPasswordResetEmail(String email);
  Future<Either<Failure, void>> setUserInfo(SetUserInfoReq userInfo);
  Future<bool> isLogIn();
  Future<Either<Failure, UserModel>> getUser();
  Future<Either<Failure, void>> logOut();
}

class AuthApiServiceImp extends AuthApiService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<bool> isLogIn() async {
    return auth.currentUser != null;
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      await auth.signOut();
      return const Right(null);
    } catch (e) {
      return const Left(AuthFailure("Logout failed"));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    if (!await isLogIn()) {
      return const Left(UserNotLoggedInFailure());
    }

    try {
      final user = auth.currentUser!;
      final doc = await firestore.collection('Users').doc(user.uid).get();

      if (!doc.exists) {
        return const Left(UserNotFoundFailure());
      }

      final userData = doc.data()!..addAll({"email": user.email});
      return Right(UserModel.fromMap(userData));
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signin(UserSigninReq params) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(
        switch (e.code) {
          'invalid-email' => const InvalidEmailFailure(),
          'wrong-password' ||
          'invalid-credential' =>
            const WrongPasswordFailure(),
          'user-not-found' => const UserNotFoundFailure(),
          _ => const ServerFailure(),
        },
      );
    } catch (e) {
      return const Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signup(UserCreationalReq params) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      await firestore.collection('Users').doc(credential.user!.uid).set({
        "userName": params.userName,
      });

      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(
        switch (e.code) {
          'weak-password' => const WeakPasswordFailure(),
          'email-already-in-use' => const EmailInUseFailure(),
          _ => const ServerFailure(),
        },
      );
    } catch (e) {
      return const Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, void>> resetPasswordPyOldPassword(
      ResetPasswordPyOldPasswordReq params) async {
    final user = auth.currentUser;
    if (user == null) return const Left(UserNotLoggedInFailure());

    try {
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: params.oldPassword,
      );

      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(params.newPassword);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(
        switch (e.code) {
          'wrong-password' => const WrongPasswordFailure(),
          'requires-recent-login' => const RequiresRecentLoginFailure(),
          _ => const ServerFailure(),
        },
      );
    } catch (e) {
      return const Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, void>> setUserInfo(SetUserInfoReq userInfo) async {
    // here i can return the current user from the set user info req class and email from current user... and show the image like image.file antile i wait for get the image from internet I may do this later
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(auth.currentUser?.uid)
          .set(userInfo.toMap(), SetOptions(merge: true));
      return const Right(null);
    } catch (error) {
      return const Left(SetUserInfoFailure());
    }
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}
