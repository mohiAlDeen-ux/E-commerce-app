abstract class Failure implements Exception {
  final String message;
  const Failure(this.message);
  
  @override
  String toString() => message;
}

class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

class InvalidEmailFailure extends AuthFailure {
  const InvalidEmailFailure() : super("No user found for this email");
}

class WrongPasswordFailure extends AuthFailure {
  const WrongPasswordFailure() : super("Wrong password provided");
}

class WeakPasswordFailure extends AuthFailure {
  const WeakPasswordFailure() : super("Password is too weak");
}

class EmailInUseFailure extends AuthFailure {
  const EmailInUseFailure() : super("Email already in use");
}

class RequiresRecentLoginFailure extends AuthFailure {
  const RequiresRecentLoginFailure() 
    : super("Please log in again before changing your password");
}

class UserNotLoggedInFailure extends AuthFailure {
  const UserNotLoggedInFailure() : super("No user logged in");
}

class UserDataFailure extends Failure {
  const UserDataFailure(super.message);
}

class UserNotFoundFailure extends UserDataFailure {
  const UserNotFoundFailure() : super("User info not found in database");
}

class SetUserInfoFailure extends UserDataFailure {
  const SetUserInfoFailure() : super("Failed to update user info");
}

class ServerFailure extends Failure {
  const ServerFailure() : super("Server error, please try again");
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure() : super("Unexpected error occurred");
}

class CloudinaryFailure extends Failure {
  const CloudinaryFailure(super.message);
}

class CloudinaryUploadFailure extends CloudinaryFailure {
  const CloudinaryUploadFailure() : super('Failed to upload image to Cloudinary');
}

class CloudinaryConfigFailure extends CloudinaryFailure {
  const CloudinaryConfigFailure() 
    : super('Missing Cloudinary configuration. Check your environment variables');
}