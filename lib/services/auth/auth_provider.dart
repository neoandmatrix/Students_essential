// this auth provider is an abstract class that dictates any auth provider the required services

import 'package:for_students/services/auth/auth_user.dart';

abstract class AuthProvider {
  Future<void> initalize();

  AuthUser? get currentUser;

  Future<AuthUser> logIn({
    required String email,
    required String password,
  });

  Future<AuthUser> createUser({
    required String email,
    required String password,
  });

  Future<void> logOut();
  Future<void> sendEmailVerification();
  Future<void> deleteUser();
  Future<bool> verifyUserEmail();
}
