import 'package:bloc/bloc.dart';
import 'package:manssour_chat_social_app/modules/social_register/cubit/states.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());
}
