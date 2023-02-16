// ignore_for_file: camel_case_types

class signupfaliure {
  final String message;

  const signupfaliure([this.message = "An unknown error occured."]);

  factory signupfaliure.code(String code){
    switch(code){
      case 'weak-password':
        return const signupfaliure('Please enter a strong password');
      case 'invalid-email':
        return const signupfaliure('Email is not valid or badly formatted');
      case 'email-already-in-use':
        return const signupfaliure('An acccount already exists for the email.');
      case 'operation-not-allowed':
        return const signupfaliure('Operation is not allowed. Please contact support');
      case 'user-disabled':
        return const signupfaliure('This user has been disabled. Please contact support');
      default:
        return const signupfaliure();
    }
  }
}