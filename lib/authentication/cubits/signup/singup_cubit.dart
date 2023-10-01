import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_horse/authentication/models/user.dart';
import 'package:my_horse/authentication/repository/auth_repository.dart';
import 'package:my_horse/authentication/services/firebase.dart';
part 'singup_state.dart';

class SingupCubit extends Cubit<SingupState> {
  final AuthRepository _authRepository;
  SingupCubit(this._authRepository) : super(SingupState.initial());

  void nameChanged(String value) {
    emit(state.copyWith(
      name: value,
      status: SingupStatus.initial,
    ));
  }

  void emailChanged(String value) {
    emit(state.copyWith(
      email: value,
      status: SingupStatus.initial,
    ));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(
      password: value,
      status: SingupStatus.initial,
    ));
  }

  Future<void> singupFormSubmitted(User user) async {
    FirestoreServie fs = FirestoreServie();

    if (state.status == SingupStatus.submitting) return;
    emit(state.copyWith(status: SingupStatus.submitting));
    try {
      await _authRepository.singup(
          email: state.email, password: state.password);
      emit(state.copyWith(status: SingupStatus.success));
    } catch (_) {}

    if (_authRepository.currentUser.email != null) {
      User a = User(
          id: _authRepository.currentUser.id,
          name: user.name,
          dateCreated: user.dateCreated,
          email: user.email,
          platform: user.platform);

      print(_authRepository.currentUser.id);
      print(user);
      fs.addUser(a);
    }

    //
  }
}
