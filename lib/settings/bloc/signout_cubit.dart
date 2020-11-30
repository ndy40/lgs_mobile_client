import 'package:bloc/bloc.dart';
import 'package:lgs_mobile_client/authentication/bloc/authentication.dart';
import 'package:lgs_mobile_client/authentication/services.dart';
import 'package:meta/meta.dart';
import 'signout_state.dart';
import 'package:get/get.dart';


class SignoutCubit extends Cubit<SignoutState> {
  final AuthService authService;

  SignoutCubit({@required this.authService}) : super(SignoutState.initial());

  void signOut() {
    emit(SignoutState.signoutRequested());
    Get.find<UserPreferenceService>().clear();
    emit(SignoutState.signoutSuccess());
    emit(SignoutState.initial());
  }
}
