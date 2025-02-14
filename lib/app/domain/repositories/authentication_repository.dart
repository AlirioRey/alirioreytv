import '../either.dart';
import '../enums.dart';
import '../models/user.dart';

abstract class AuthenticationRepository {
  Future<bool> get isSignedIn;
  Future<User?> guetUserData();
  Future<void> signOut();
  Future<Either<SignInFailure, User>> signIn(
    String username,
    String password,
  );
}
