

import '../../../models/login_model.dart';

abstract class SocialLoginStates {}

class SocialLoginInitialState extends SocialLoginStates {}

class SocialLoginLoadingState extends SocialLoginStates {}

class SocialLoginSuccessState extends SocialLoginStates {
  final SocialLoginModel loginModel;

  SocialLoginSuccessState(this.loginModel);
}

class SocialLoginErrorState extends SocialLoginStates {
  final String error;

  SocialLoginErrorState(this.error);

}

class SocialChangePasswordVisibilityState extends SocialLoginStates {}
