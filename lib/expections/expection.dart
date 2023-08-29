class SignupWithEmailAndPasswordfailure {
  final String message;

  const SignupWithEmailAndPasswordfailure(
      [this.message = 'An unknown error occured']);

  factory SignupWithEmailAndPasswordfailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return SignupWithEmailAndPasswordfailure(
            'Please enter a strong password');
      case 'invalid-email':
        return SignupWithEmailAndPasswordfailure(
            'Email is not valid or badly formatted');
      case 'email-already-in-use':
        return SignupWithEmailAndPasswordfailure(
            'An account already exists for that email');
      case 'opearation-not-allowed':
        return SignupWithEmailAndPasswordfailure(
            'Opeartion is not allowed. Please contact support');
      case 'user-disabled':
        return SignupWithEmailAndPasswordfailure(
            'This user has been disabled.please contact support for help');
      default:
        return SignupWithEmailAndPasswordfailure();
    }
  }
}
