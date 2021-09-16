/// All possible error codes returned from Identity Platform REST API.
class ErrorCode {
  /// Thrown if there is no registered user corresponding to this email.
  static const emailNotFound = 'EMAIL_NOT_FOUND';

  /// Thrown if the password of this user is invalid.
  static const invalidPassword = 'INVALID_PASSWORD';

  /// Thrown if the user exists but is disabled.
  static const userDisabled = 'USER_DISABLED';

  /// Thrown if the user is trying to sign up with an existed email.
  static const emailExists = 'EMAIL_EXISTS';

  /// Thrown if password sign-in feature is disabled for this project.
  static const operationNotAllowed = 'OPERATION_NOT_ALLOWED';

  /// Thrown if this device is blocked due to unusual activity.
  static const tooManyAttempts = 'TOO_MANY_ATTEMPTS_TRY_LATER';
}

/// And exception wrapping error codes from the IP API.
class IPException implements Exception {
  // ignore: public_member_api_docs
  IPException([this.message = '', this.code]);

  /// Constrict and IPException based on the returned error code.
  factory IPException.fromErrorCode(String? code) {
    switch (code) {
      case ErrorCode.emailNotFound:
        return IPException(
            'There is no user record corresponding to this identifier.'
            ' The user may have been deleted.',
            code);
      case ErrorCode.invalidPassword:
        return IPException(
            'The password is invalid or the user does not have a password.',
            code);
      case ErrorCode.userDisabled:
        return IPException(
            'The user account has been disabled by an administrator.', code);
      case ErrorCode.emailExists:
        return IPException(
            'The email address is already in use by another account.', code);
      case ErrorCode.operationNotAllowed:
        return IPException(
            'Password sign-in is disabled for this project.', code);
      case ErrorCode.tooManyAttempts:
        return IPException(
            'We have blocked all requests from this device'
            ' due to unusual activity. Try again later.',
            code);
      default:
        return IPException('Unknown error happened.', 'UNKNOWN');
    }
  }

  /// A message describing the IP error.
  final String message;

  // ignore: public_member_api_docs
  final String? code;

  @override
  String toString() => message;
}
