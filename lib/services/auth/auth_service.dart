import 'package:for_students/services/auth/auth_provider.dart';
import 'package:for_students/services/auth/auth_user.dart';
import 'package:for_students/services/auth/firebase_auth_provider.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;

  AuthService({required this.provider});

  factory AuthService.firebase() => AuthService(
        provider: FirebseAuthProvider(),
      );

  @override
  Future<AuthUser> createUser(
      {required String email, required String password}) {
    return provider.createUser(
      email: email,
      password: password,
    );
  }

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<void> deleteUser() async {
    return await provider.deleteUser();
  }

  @override
  Future<void> initalize() {
    return provider.initalize();
  }

  @override
  Future<AuthUser> logIn({required String email, required String password}) {
    return provider.logIn(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logOut() async {
    return await provider.logOut();
  }

  @override
  Future<void> sendEmailVerification() async {
    return await provider.sendEmailVerification();
  }
}
